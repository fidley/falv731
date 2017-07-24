*----------------------------------------------------------------------*
*       CLASS lcl_output IMPLEMENTATION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_output IMPLEMENTATION.

  METHOD constructor.
    CALL FUNCTION 'GUID_CREATE'
      IMPORTING
        ev_guid_22 = guid.
    falv = io_falv.
  ENDMETHOD.                    "constructor
  METHOD show.
*Begin SMD
*    loop at outputs assigning field-symbol(<hide>) where table_line->guid ne me->guid.
    FIELD-SYMBOLS: <hide> LIKE LINE OF outputs.
    LOOP AT outputs ASSIGNING <hide> WHERE table_line->guid NE me->guid.
*End SMD
      <hide>->hide( ).
    ENDLOOP.
    falv->set_visible( abap_true ).
    falv->parent->set_visible( abap_true ).
    falv->main_container->set_visible( abap_true ).
  ENDMETHOD.                    "show
  METHOD hide.
    falv->set_visible( abap_false ).
    falv->parent->set_visible( abap_false ).
    falv->main_container->set_visible( abap_false ).
  ENDMETHOD.                    "hide

  METHOD pbo.
    show( ).
    IF sy-dynnr EQ zcl_falv=>c_screen_popup AND first_output EQ abap_true.
      cl_gui_cfw=>flush(
        EXCEPTIONS
          cntl_system_error = 1
          cntl_error        = 2
          OTHERS            = 3
      ).
      IF sy-subrc <> 0.
*       message id sy-msgid type sy-msgty number sy-msgno
*                  with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
      ENDIF.
      falv->parent->set_enable(
        EXPORTING
          enable            =  abap_true   " Enable/disable state flag
        EXCEPTIONS
          cntl_error        = 1
          cntl_system_error = 2
          OTHERS            = 3
      ).
      IF sy-subrc <> 0.
*       message id sy-msgid type sy-msgty number sy-msgno
*                  with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
      ENDIF.
      IF first_output EQ abap_true.
*Begin SMD
*        data(falv_popup) = falv->create_by_copy(
**                       i_parent          =
**                        i_applogparent    =
*                          i_popup           = abap_true
**                       i_applog_embedded = ABAP_FALSE
*                     ).
        DATA: falv_popup TYPE REF TO zcl_falv.
        falv_popup = falv->create_by_copy(
*                       i_parent          =
*                        i_applogparent    =
                          i_popup           = abap_true
*                       i_applog_embedded = ABAP_FALSE
                     ).
*End SMD
        falv  ?= falv_popup.
      ENDIF.
    ENDIF.
    falv->pbo( iv_dynnr = iv_dynnr ).
    IF first_output EQ abap_true.

      cl_gui_cfw=>flush(
  EXCEPTIONS
    cntl_system_error = 1
    cntl_error        = 2
    OTHERS            = 3
).
      IF sy-subrc <> 0.
*       message id sy-msgid type sy-msgty number sy-msgno
*                  with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
      ENDIF.
      falv->display( iv_force_grid = abap_true ).
      CLEAR first_output.
      IF falv->split_container IS NOT INITIAL.
        "! When I use embedded applog then although it's container is hidden
        "! then you can still see the place for it until some pbo will happen.
        "! I force dummy user-command to get rid of it
        CALL FUNCTION 'SAPGUI_SET_FUNCTIONCODE'
          EXPORTING
            functioncode           = 'DUMMY'    " Function code
          EXCEPTIONS
            function_not_supported = 1
            OTHERS                 = 2.
        IF sy-subrc <> 0.
        ENDIF.
      ENDIF.
    ENDIF.

  ENDMETHOD.                    "pbo

  METHOD pai.
    CHECK c_ucomm IS NOT INITIAL.
    falv->pai( EXPORTING iv_dynnr = sy-dynnr CHANGING c_ucomm  = c_ucomm ).
  ENDMETHOD.                    "pai

  METHOD end_of_ss1001.
    RECEIVE RESULTS FROM FUNCTION 'Z_FALV_CALL_MASS_SS'
      IMPORTING
        et_rsparams       = mass_repl_params.
    wait_for_mass_repl = space.
  ENDMETHOD.                    "end_of_ss1001

  METHOD set_ss1001_status.
    DATA: exclude TYPE STANDARD TABLE OF rsexfcode.
    IF sy-dynnr EQ 1001.
*Begin SMD
*      exclude = value #( ( fcode = 'GET' ) ( fcode = 'SPOS' ) ( fcode = 'NONE' ) ).
      DATA: ls_exclude LIKE LINE OF exclude.
      REFRESH: exclude.
      CLEAR: ls_exclude.
      ls_exclude-fcode = 'GET'.
      APPEND ls_exclude TO exclude.
      CLEAR: ls_exclude.
      ls_exclude-fcode = 'SPOS'.
      APPEND ls_exclude TO exclude.
      CLEAR: ls_exclude.
      ls_exclude-fcode = 'NONE'.
      APPEND ls_exclude TO exclude.
*End SMD
      CALL FUNCTION 'RS_SET_SELSCREEN_STATUS'
        EXPORTING
          p_status  = space
          p_program = sy-repid
        TABLES
          p_exclude = exclude.
    ENDIF.

  ENDMETHOD.                    "set_ss1001_status

ENDCLASS.                    "lcl_output IMPLEMENTATION
