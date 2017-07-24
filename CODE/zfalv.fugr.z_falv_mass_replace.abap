FUNCTION Z_FALV_MASS_REPLACE.
*"--------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(IO_GRID) TYPE REF TO CL_GUI_ALV_GRID
*"  CHANGING
*"     REFERENCE(CT_OUTTAB) TYPE  STANDARD TABLE
*"--------------------------------------------------------------------
.

  DATA: ft_rsparams TYPE rsparams_tt.
  DATA: f_lines TYPE i.
  DATA: f_num(2) TYPE n.
  DATA: f_index TYPE i.
  DATA: f_field TYPE string.
  DATA: f_changed TYPE flag.
  DATA: f_tabix TYPE i.
  DATA: f_space LIKE LINE OF ft_rsparams.
  FIELD-SYMBOLS: <paramsf> LIKE LINE OF ft_rsparams.
  FIELD-SYMBOLS: <paramst> LIKE LINE OF ft_rsparams.
  FIELD-SYMBOLS: <paramsc> LIKE LINE OF ft_rsparams.
  FIELD-SYMBOLS: <params_save> LIKE LINE OF ft_rsparams.
  FIELD-SYMBOLS: <outtab> TYPE ANY TABLE.
  FIELD-SYMBOLS: <outtab_ref> TYPE ANY TABLE.
  FIELD-SYMBOLS: <outp> TYPE any.
  FIELD-SYMBOLS: <value> TYPE lvc_s_modi-value.
  FIELD-SYMBOLS: <out_line> TYPE lvc_t_styl.
  FIELD-SYMBOLS: <style> TYPE lvc_s_styl.
  FIELD-SYMBOLS: <any> TYPE any.
  IF io_grid->is_ready_for_input( ) EQ 0.
    MESSAGE s001(00) DISPLAY LIKE 'W' WITH 'Grid should be in edit mode in order to use this function!'(e01).
    RETURN.
  ENDIF.

*Begin SMD
  DATA: layout TYPE lvc_s_layo.
*End SMD
  io_grid->get_frontend_layout(
    IMPORTING
*Begin SMD
*      es_layout = data(layout)
      es_layout = layout
*End SMD
  ).

*Begin SMD
  DATA: fcat TYPE lvc_t_fcat.
*End SMD
  io_grid->get_frontend_fieldcatalog(
  IMPORTING
*Begin SMD
*    et_fieldcatalog = data(fcat)
et_fieldcatalog = fcat
*End SMD
    ).
*Begin SMD
  DATA: filtered TYPE lvc_t_fidx.
*End SMD
  io_grid->get_filtered_entries(
      IMPORTING
*Begin SMD
*        et_filtered_entries = data(filtered)
et_filtered_entries = filtered
*End SMD
     ).

*Begin SMD
  DATA: selected_rows TYPE lvc_t_roid.
*End SMD
  io_grid->get_selected_rows(
      IMPORTING
*Begin SMD
*        et_row_no     =  data(selected_rows)
        et_row_no     =  selected_rows
*End SMD
    ).

*Begin SMD
  DATA: selected_cols TYPE lvc_t_col.
*End SMD
  io_grid->get_selected_columns(
  IMPORTING
*Begin SMD
*    et_index_columns = data(selected_cols)
    et_index_columns = selected_cols
*End SMD
    ).

  SORT selected_rows BY row_id.

  "remove not editable fields
  IF layout-edit EQ abap_false. "full grid editable
    DELETE fcat WHERE edit EQ abap_false.
    IF fcat IS INITIAL.
      MESSAGE s001(00) DISPLAY LIKE 'W' WITH 'No editable fields in the grid'(e02).
      RETURN.
    ENDIF.
  ENDIF.
  SORT fcat BY fieldname.
*Begin SMD

*  loop at selected_cols assigning field-symbol(<col>).
  FIELD-SYMBOLS: <col> LIKE LINE OF selected_cols.
  DATA: tabix TYPE sy-tabix.
  LOOP AT selected_cols ASSIGNING <col>.

*    data(tabix) = sy-tabix.
    tabix = sy-tabix.
*End SMD
    READ TABLE fcat WITH KEY fieldname = <col>-fieldname TRANSPORTING NO FIELDS BINARY SEARCH.
    IF sy-subrc NE 0.
      DELETE selected_cols INDEX tabix.
    ENDIF.
  ENDLOOP.
  IF sy-subrc EQ 0.
    IF selected_cols[] IS INITIAL.
      MESSAGE s001(00) DISPLAY LIKE 'W' WITH 'Please select editable fields only'(e03).
      RETURN.
    ENDIF.
  ENDIF.

  IF selected_cols[] IS INITIAL.
    MESSAGE s001(00) DISPLAY LIKE 'W' WITH 'Please select at least one column!'(e04).
    RETURN.
  ENDIF.

  IF lines( selected_cols ) GT 10.
    MESSAGE s001(00) DISPLAY LIKE 'W' WITH 'Maximum number of columns in mass change function is 10'(e05).
    RETURN.
  ENDIF.

*Begin SMD
  DATA: fieldname TYPE string.
  FIELD-SYMBOLS: <fcat> LIKE LINE OF fcat.
*End SMD
  LOOP AT selected_cols ASSIGNING <col>.
*Begin SMD
*    data(fieldname) = |G_{ <col>-fieldname }|.
    fieldname = |G_{ <col>-fieldname }|.
*End SMD
    ASSIGN (fieldname) TO <any>.
    IF sy-subrc EQ 0.
      <any> = 'X'.
*Begin SMD
*      READ TABLE fcat WITH KEY fieldname = <col>-fieldname ASSIGNING field-symbol(<fcat>) BINARY SEARCH.
      READ TABLE fcat WITH KEY fieldname = <col>-fieldname ASSIGNING <fcat> BINARY SEARCH.
*End SMD
      IF sy-subrc EQ 0.
        fieldname = |PD{ <col>-fieldname }|.
        ASSIGN (fieldname) TO <any>.
        IF sy-subrc EQ 0.
          <any> = <fcat>-scrtext_s.
        ENDIF.
      ENDIF.
    ENDIF.
  ENDLOOP.

  REFRESH <out>->mass_repl_params .
  SORT fcat BY col_pos.
  DATA: act_sessions TYPE sta_cntre,
        max_sessions TYPE sta_cntre.

  CALL FUNCTION 'TH_USER_INFO'
    IMPORTING
      act_sessions = act_sessions
      max_sessions = max_sessions.

  IF max_sessions - act_sessions GT 0.
    <out>->wait_for_mass_repl = abap_true.
    CALL FUNCTION 'Z_FALV_CALL_MASS_SS'
      DESTINATION 'NONE'
      STARTING NEW TASK 'ZFALVMASSR'
      CALLING <out>->end_of_ss1001 ON END OF TASK
      EXPORTING
        it_mass_sel_columns = selected_cols
        it_fcat_mass        = fcat.
  ELSE.
    MESSAGE s001(00) DISPLAY LIKE 'W' WITH 'No more free sessions. Close one window.'(e06).
    RETURN.
  ENDIF.
  WAIT UNTIL <out>->wait_for_mass_repl EQ abap_false.

  SORT <out>->mass_repl_params BY selname.
  CLEAR f_num.
  DATA: f_row TYPE i.
  DATA: ft_delta TYPE lvc_t_modi.
  DATA: fs_delta TYPE lvc_s_modi.
  ft_rsparams[] = <out>->mass_repl_params[].
  SORT ft_rsparams BY selname.
  CLEAR f_num.
  LOOP AT fcat ASSIGNING <fcat>.
    READ TABLE selected_cols[] WITH KEY fieldname = <fcat>-fieldname TRANSPORTING NO FIELDS." binary search.
    IF sy-subrc EQ 0.
      ADD 1 TO f_num.
      CONCATENATE 'P_PARC' f_num INTO f_field.
      READ TABLE ft_rsparams ASSIGNING <paramsc> WITH KEY selname = f_field BINARY SEARCH.
      IF sy-subrc NE 0.
        ASSIGN f_space TO <paramsc>.
      ENDIF.
      CONCATENATE 'P_PARF' f_num INTO f_field.
      READ TABLE ft_rsparams ASSIGNING <paramsf> WITH KEY selname = f_field BINARY SEARCH.
      IF sy-subrc EQ 0.
        CONCATENATE 'P_PART' f_num INTO f_field.
        READ TABLE ft_rsparams ASSIGNING <paramst> WITH KEY selname = f_field BINARY SEARCH.
        IF sy-subrc EQ 0 AND ( <paramsf>-low NE <paramst>-low  OR <paramsc>-low EQ abap_true ).
          LOOP AT ct_outtab ASSIGNING <outp>.
            f_row = sy-tabix.
            IF filtered[] IS NOT INITIAL.
              READ TABLE filtered WITH KEY table_line = f_row TRANSPORTING NO FIELDS.
              IF sy-subrc EQ 0.
                CONTINUE.
              ENDIF.
            ENDIF.
            IF selected_rows[] IS NOT INITIAL.
              READ TABLE selected_rows WITH KEY row_id = f_row TRANSPORTING NO FIELDS BINARY SEARCH.
              IF sy-subrc NE 0. "only selected rows can be changed.
                CONTINUE.
              ENDIF.
            ENDIF.
            ASSIGN COMPONENT <fcat>-fieldname OF STRUCTURE <outp> TO <any>.
            IF sy-subrc EQ 0 AND ( <any> EQ <paramsf>-low OR <paramsc>-low EQ abap_true ).
              "check if field is not disabled in row :)
              IF layout-stylefname IS NOT INITIAL.
                ASSIGN COMPONENT layout-stylefname OF STRUCTURE <outp> TO <out_line>.
                IF sy-subrc EQ 0.
                  READ TABLE <out_line> WITH KEY fieldname = <fcat>-fieldname ASSIGNING <style>.
                  IF sy-subrc EQ 0 AND <style>-style EQ cl_gui_alv_grid=>mc_style_disabled.
                    "do not change that cell as it's not editable.
                    CONTINUE.
                  ENDIF.
                ENDIF.
              ENDIF.

              <any> = <paramst>-low.
              CLEAR fs_delta.
              fs_delta-fieldname = <fcat>-fieldname.
              fs_delta-row_id    = f_row.
              fs_delta-value = <paramst>-low.
              APPEND fs_delta TO ft_delta.

              f_changed = abap_true.
            ENDIF.
          ENDLOOP.
        ENDIF.
      ENDIF.
    ENDIF.
  ENDLOOP.

  IF f_changed EQ abap_true.
    sy-ucomm = 'MASSREPL'.
    "<outtab_ref> = <outtab>.
    io_grid->set_delta_cells(
      EXPORTING
        it_delta_cells  = ft_delta    " Delta Table
        i_modified      = abap_true    " Modified
        i_frontend_only = abap_true   " Update only at Frontend
    ).
    sy-ucomm = space.
    io_grid->check_changed_data( ).
  ENDIF.





ENDFUNCTION.
