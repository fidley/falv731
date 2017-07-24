class ZCL_FALV_DYNAMIC_STATUS definition
  public
  final
  create public .

public section.
*"* public components of class ZCL_FALV_DYNAMIC_STATUS
*"* do not include other source files here!!!

  interfaces IF_OS_CLONE .

  types:
    begin of t_buttons,
             f01 type rsfunc_txt,
             f02 type rsfunc_txt,
             f03 type rsfunc_txt,
             f04 type rsfunc_txt,
             f05 type rsfunc_txt,
             f06 type rsfunc_txt,
             f07 type rsfunc_txt,
             f08 type rsfunc_txt,
             f09 type rsfunc_txt,
             f10 type rsfunc_txt,
             f11 type rsfunc_txt,
             f12 type rsfunc_txt,
             f13 type rsfunc_txt,
             f14 type rsfunc_txt,
             f15 type rsfunc_txt,
             f16 type rsfunc_txt,
             f17 type rsfunc_txt,
             f18 type rsfunc_txt,
             f19 type rsfunc_txt,
             f20 type rsfunc_txt,
             f21 type rsfunc_txt,
             f22 type rsfunc_txt,
             f23 type rsfunc_txt,
             f24 type rsfunc_txt,
             f25 type rsfunc_txt,
             f26 type rsfunc_txt,
             f27 type rsfunc_txt,
             f28 type rsfunc_txt,
             f29 type rsfunc_txt,
             f30 type rsfunc_txt,
             f31 type rsfunc_txt,
             f32 type rsfunc_txt,
             f33 type rsfunc_txt,
             f34 type rsfunc_txt,
             f35 type rsfunc_txt,
           end of t_buttons .
  types:
    begin of t_allowed_but,
             function type sy-ucomm,
           end of t_allowed_but .
  types:
    tt_excluded_but type standard table of sy-ucomm .
  types:
    tt_allowed_but type standard table of t_allowed_but .

  constants B_01 type SY-UCOMM value 'F01'. "#EC NOTEXT
  constants B_02 type SY-UCOMM value 'F02'. "#EC NOTEXT
  constants B_03 type SY-UCOMM value 'F03'. "#EC NOTEXT
  constants B_04 type SY-UCOMM value 'F04'. "#EC NOTEXT
  constants B_05 type SY-UCOMM value 'F05'. "#EC NOTEXT
  constants B_06 type SY-UCOMM value 'F06'. "#EC NOTEXT
  constants B_07 type SY-UCOMM value 'F07'. "#EC NOTEXT
  constants B_08 type SY-UCOMM value 'F08'. "#EC NOTEXT
  constants B_09 type SY-UCOMM value 'F09'. "#EC NOTEXT
  constants B_10 type SY-UCOMM value 'F10'. "#EC NOTEXT
  constants B_11 type SY-UCOMM value 'F11'. "#EC NOTEXT
  constants B_12 type SY-UCOMM value 'F12'. "#EC NOTEXT
  constants B_13 type SY-UCOMM value 'F13'. "#EC NOTEXT
  constants B_14 type SY-UCOMM value 'F14'. "#EC NOTEXT
  constants B_15 type SY-UCOMM value 'F15'. "#EC NOTEXT
  constants B_16 type SY-UCOMM value 'F16'. "#EC NOTEXT
  constants B_17 type SY-UCOMM value 'F17'. "#EC NOTEXT
  constants B_18 type SY-UCOMM value 'F18'. "#EC NOTEXT
  constants B_19 type SY-UCOMM value 'F19'. "#EC NOTEXT
  constants B_20 type SY-UCOMM value 'F20'. "#EC NOTEXT
  constants B_21 type SY-UCOMM value 'F21'. "#EC NOTEXT
  constants B_22 type SY-UCOMM value 'F22'. "#EC NOTEXT
  constants B_23 type SY-UCOMM value 'F23'. "#EC NOTEXT
  constants B_24 type SY-UCOMM value 'F24'. "#EC NOTEXT
  constants B_25 type SY-UCOMM value 'F25'. "#EC NOTEXT
  constants B_26 type SY-UCOMM value 'F26'. "#EC NOTEXT
  constants B_27 type SY-UCOMM value 'F27'. "#EC NOTEXT
  constants B_28 type SY-UCOMM value 'F28'. "#EC NOTEXT
  constants B_29 type SY-UCOMM value 'F29'. "#EC NOTEXT
  constants B_30 type SY-UCOMM value 'F30'. "#EC NOTEXT
  constants B_31 type SY-UCOMM value 'F31'. "#EC NOTEXT
  constants B_32 type SY-UCOMM value 'F32'. "#EC NOTEXT
  constants B_33 type SY-UCOMM value 'F33'. "#EC NOTEXT
  constants B_34 type SY-UCOMM value 'F34'. "#EC NOTEXT
  constants B_35 type SY-UCOMM value 'F35'. "#EC NOTEXT
  data FULLY_DYNAMIC type ABAP_BOOL .
  data EXCLUDED_BUTTONS type TT_EXCLUDED_BUT .
  data BUTTONS type T_BUTTONS .

  methods CONSTRUCTOR .
  methods ADD_BUTTON
    importing
      value(IV_BUTTON) type SY-UCOMM
      value(IV_TEXT) type SMP_DYNTXT-TEXT optional
      value(IV_ICON) type SMP_DYNTXT-ICON_ID optional
      value(IV_QINFO) type SMP_DYNTXT-QUICKINFO optional
      value(IV_ALLOWED) type ABAP_BOOL default ABAP_TRUE
    exceptions
      BUTTON_ALREADY_FILLED
      BUTTON_DOES_NOT_EXISTS
      ICON_AND_TEXT_EMPTY .
  methods HIDE_BUTTON
    importing
      value(IV_BUTTON) type SY-UCOMM .
  methods SHOW_BUTTON
    importing
      value(IV_BUTTON) type SY-UCOMM .
  methods GET_TOOLBAR
    exporting
      !E_TOOLBAR type T_BUTTONS .
  methods ADD_SEPARATOR
    importing
      value(IV_BUTTON) type SY-UCOMM .
  methods SHOW_TITLE
    importing
      value(IV_TEXT1) type STRING
      value(IV_TEXT2) type STRING optional
      value(IV_TEXT3) type STRING optional
      value(IV_TEXT4) type STRING optional
      value(IV_TEXT5) type STRING optional .
  methods SHOW_GUI_STATUS .
protected section.
*"* protected components of class ZCL_FALV_DYNAMIC_STATUS
*"* do not include other source files here!!!

  data ALLOWED_BUTTONS type TT_ALLOWED_BUT .
private section.
*"* private components of class ZCL_FALV_DYNAMIC_STATUS
*"* do not include other source files here!!!
ENDCLASS.



CLASS ZCL_FALV_DYNAMIC_STATUS IMPLEMENTATION.


method add_button.
    data button type smp_dyntxt.
    check iv_button is not initial.

    if iv_text is initial and iv_icon is initial.
      raise icon_and_text_empty.
      return.
    endif.

    button-icon_id = iv_icon.
    button-icon_text = iv_text.
    button-text      = iv_text.
    button-quickinfo = iv_qinfo.
*Begin SMD
*    assign component iv_button of structure buttons to field-symbol(<bt>).
    FIELD-SYMBOLS: <bt> type rsfunc_txt.
    assign component iv_button of structure buttons to <bt>.
*End SMD
    if <bt> is assigned.
      if <bt> is initial.
        <bt> = button.
        if iv_allowed eq abap_true.
          show_button( iv_button = iv_button ).
        endif.
      else.
        raise button_already_filled.
      endif.
    else.
      raise button_does_not_exists.
    endif.
  endmethod.


method add_separator.
    add_button(
      exporting
        iv_button              = iv_button
        iv_text                = |{ cl_abap_char_utilities=>minchar }|
*        iv_icon                = iv_icon
*        iv_qinfo               = iv_qinfo
         iv_allowed             = abap_true
      exceptions
        button_already_filled  = 1
        button_does_not_exists = 2
        icon_and_text_empty    = 3
        others                 = 4
    ).
    if sy-subrc <> 0.
*     message id sy-msgid type sy-msgty number sy-msgno
*                with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    endif.
  endmethod.


METHOD constructor.
*Begin SMD
*  excluded_buttons = value #( ( b_01 ) ( b_02 ) ( b_03 ) ( b_04 ) ( b_05 ) ( b_06 ) ( b_07 ) ( b_08 ) ( b_09 )
*                              ( b_10 ) ( b_11 ) ( b_12 ) ( b_13 ) ( b_14 ) ( b_15 ) ( b_16 ) ( b_17 ) ( b_18 ) ( b_19 )
*                              ( b_20 ) ( b_21 ) ( b_22 ) ( b_23 ) ( b_24 ) ( b_25 ) ( b_26 ) ( b_27 ) ( b_28 ) ( b_29 )
*                              ( b_30 ) ( b_31 ) ( b_32 ) ( b_33 ) ( b_34 ) ( b_35 )
*                              ( zcl_falv=>mc_fc_data_save ) ( zcl_falv=>fc_find ) ( zcl_falv=>fc_find_next ) ( zcl_falv=>fc_first_page )
*                              ( zcl_falv=>fc_last_page ) ( zcl_falv=>fc_next_page ) ( zcl_falv=>fc_previous_page ) ( zcl_falv=>fc_print ) ).
  DATA: ls_excluded_buttons LIKE LINE OF excluded_buttons.
  REFRESH: excluded_buttons.
  CLEAR: ls_excluded_buttons.
  ls_excluded_buttons = ( b_01 ).
  APPEND ls_excluded_buttons TO excluded_buttons.
  CLEAR: ls_excluded_buttons.
  ls_excluded_buttons = ( b_02 ).
  APPEND ls_excluded_buttons TO excluded_buttons.
  CLEAR: ls_excluded_buttons.
  ls_excluded_buttons = ( b_03 ).
  APPEND ls_excluded_buttons TO excluded_buttons.
  CLEAR: ls_excluded_buttons.
  ls_excluded_buttons = ( b_04 ).
  APPEND ls_excluded_buttons TO excluded_buttons.
  CLEAR: ls_excluded_buttons.
  ls_excluded_buttons = ( b_05 ).
  APPEND ls_excluded_buttons TO excluded_buttons.
  CLEAR: ls_excluded_buttons.
  ls_excluded_buttons = ( b_06 ).
  APPEND ls_excluded_buttons TO excluded_buttons.
  CLEAR: ls_excluded_buttons.
  ls_excluded_buttons = ( b_07 ).
  APPEND ls_excluded_buttons TO excluded_buttons.
  CLEAR: ls_excluded_buttons.
  ls_excluded_buttons = ( b_08 ).
  APPEND ls_excluded_buttons TO excluded_buttons.
  CLEAR: ls_excluded_buttons.
  ls_excluded_buttons = ( b_09 ).
  APPEND ls_excluded_buttons TO excluded_buttons.
  CLEAR: ls_excluded_buttons.
  ls_excluded_buttons = ( b_10 ).
  APPEND ls_excluded_buttons TO excluded_buttons.
  CLEAR: ls_excluded_buttons.
  ls_excluded_buttons = ( b_11 ).
  APPEND ls_excluded_buttons TO excluded_buttons.
  CLEAR: ls_excluded_buttons.
  ls_excluded_buttons = ( b_12 ).
  APPEND ls_excluded_buttons TO excluded_buttons.
  CLEAR: ls_excluded_buttons.
  ls_excluded_buttons = ( b_13 ).
  APPEND ls_excluded_buttons TO excluded_buttons.
  CLEAR: ls_excluded_buttons.
  ls_excluded_buttons = ( b_14 ).
  APPEND ls_excluded_buttons TO excluded_buttons.
  CLEAR: ls_excluded_buttons.
  ls_excluded_buttons = ( b_15 ).
  APPEND ls_excluded_buttons TO excluded_buttons.
  CLEAR: ls_excluded_buttons.
  ls_excluded_buttons = ( b_16 ).
  APPEND ls_excluded_buttons TO excluded_buttons.
  CLEAR: ls_excluded_buttons.
  ls_excluded_buttons = ( b_17 ).
  APPEND ls_excluded_buttons TO excluded_buttons.
  CLEAR: ls_excluded_buttons.
  ls_excluded_buttons = ( b_18 ).
  APPEND ls_excluded_buttons TO excluded_buttons.
  CLEAR: ls_excluded_buttons.
  ls_excluded_buttons = ( b_19 ).
  APPEND ls_excluded_buttons TO excluded_buttons.
  CLEAR: ls_excluded_buttons.
  ls_excluded_buttons = ( b_20 ).
  APPEND ls_excluded_buttons TO excluded_buttons.
  CLEAR: ls_excluded_buttons.
  ls_excluded_buttons = ( b_21 ).
  APPEND ls_excluded_buttons TO excluded_buttons.
  CLEAR: ls_excluded_buttons.
  ls_excluded_buttons = ( b_22 ).
  APPEND ls_excluded_buttons TO excluded_buttons.
  CLEAR: ls_excluded_buttons.
  ls_excluded_buttons = ( b_23 ).
  APPEND ls_excluded_buttons TO excluded_buttons.
  CLEAR: ls_excluded_buttons.
  ls_excluded_buttons = ( b_24 ).
  APPEND ls_excluded_buttons TO excluded_buttons.
  CLEAR: ls_excluded_buttons.
  ls_excluded_buttons = ( b_25 ).
  APPEND ls_excluded_buttons TO excluded_buttons.
  CLEAR: ls_excluded_buttons.
  ls_excluded_buttons = ( b_26 ).
  APPEND ls_excluded_buttons TO excluded_buttons.
  CLEAR: ls_excluded_buttons.
  ls_excluded_buttons = ( b_27 ).
  APPEND ls_excluded_buttons TO excluded_buttons.
  CLEAR: ls_excluded_buttons.
  ls_excluded_buttons = ( b_28 ).
  APPEND ls_excluded_buttons TO excluded_buttons.
  CLEAR: ls_excluded_buttons.
  ls_excluded_buttons = ( b_29 ).
  APPEND ls_excluded_buttons TO excluded_buttons.
  CLEAR: ls_excluded_buttons.
  ls_excluded_buttons = ( b_30 ).
  APPEND ls_excluded_buttons TO excluded_buttons.
  CLEAR: ls_excluded_buttons.
  ls_excluded_buttons = ( b_31 ).
  APPEND ls_excluded_buttons TO excluded_buttons.
  CLEAR: ls_excluded_buttons.
  ls_excluded_buttons = ( b_32 ).
  APPEND ls_excluded_buttons TO excluded_buttons.
  CLEAR: ls_excluded_buttons.
  ls_excluded_buttons = ( b_33 ).
  APPEND ls_excluded_buttons TO excluded_buttons.
  CLEAR: ls_excluded_buttons.
  ls_excluded_buttons = ( b_34 ).
  APPEND ls_excluded_buttons TO excluded_buttons.
  CLEAR: ls_excluded_buttons.
  ls_excluded_buttons = ( b_35 ).
  APPEND ls_excluded_buttons TO excluded_buttons.
  CLEAR: ls_excluded_buttons.
  ls_excluded_buttons = ( zcl_falv=>mc_fc_data_save ).
  APPEND ls_excluded_buttons TO excluded_buttons.
  CLEAR: ls_excluded_buttons.
  ls_excluded_buttons = ( zcl_falv=>fc_find ).
  APPEND ls_excluded_buttons TO excluded_buttons.
  CLEAR: ls_excluded_buttons.
  ls_excluded_buttons = ( zcl_falv=>fc_find_next ).
  APPEND ls_excluded_buttons TO excluded_buttons.
  CLEAR: ls_excluded_buttons.
  ls_excluded_buttons = ( zcl_falv=>fc_first_page ).
  APPEND ls_excluded_buttons TO excluded_buttons.
  CLEAR: ls_excluded_buttons.
  ls_excluded_buttons = ( zcl_falv=>fc_last_page ).
  APPEND ls_excluded_buttons TO excluded_buttons.
  CLEAR: ls_excluded_buttons.
  ls_excluded_buttons = ( zcl_falv=>fc_next_page ).
  APPEND ls_excluded_buttons TO excluded_buttons.
  CLEAR: ls_excluded_buttons.
  ls_excluded_buttons = ( zcl_falv=>fc_previous_page ).
  APPEND ls_excluded_buttons TO excluded_buttons.
  CLEAR: ls_excluded_buttons.
  ls_excluded_buttons = ( zcl_falv=>fc_print ).
  APPEND ls_excluded_buttons TO excluded_buttons.
*End SMD
ENDMETHOD.


method get_toolbar.
    e_toolbar = buttons.
  endmethod.


method hide_button.
    check iv_button is not initial.
*Begin SMD
*    if line_exists( allowed_buttons[ function = iv_button ] ).
    FIELD-SYMBOLS: <allowed_buttons> like LINE OF allowed_buttons.
    READ TABLE allowed_buttons ASSIGNING <allowed_buttons> with key function = iv_button.
    IF sy-subrc eq 0.
*End SMD
      delete allowed_buttons where function = iv_button.
      append iv_button to excluded_buttons.
    endif.
  endmethod.


method if_os_clone~clone.
      system-call objmgr clone me to result.
    endmethod.


METHOD show_button.
  CHECK iv_button IS NOT INITIAL.
*Begin SMD
*    if not line_exists( allowed_buttons[ function = iv_button ] ).
*      data(allowed) = value t_allowed_but( function = iv_button ).
  FIELD-SYMBOLS: <allowed_buttons> LIKE LINE OF allowed_buttons.
  DATA: allowed type t_allowed_but.
  READ TABLE allowed_buttons ASSIGNING <allowed_buttons> WITH KEY function = iv_button.
  IF sy-subrc NE 0.
    CLEAR: allowed.
    allowed-function = iv_button.
*End SMD
    APPEND allowed TO allowed_buttons.
    DELETE excluded_buttons WHERE table_line EQ iv_button.
  ENDIF.
ENDMETHOD.


method show_gui_status.
   if sy-dynnr eq zcl_falv=>c_screen_full and fully_dynamic eq abap_true.
      set pf-status 'DYNAMIC_STATUS' of program zcl_falv=>c_fscr_repid excluding excluded_buttons.
    elseif sy-dynnr eq zcl_falv=>c_screen_full.
      set pf-status 'DYNAMIC_STATUS_PART' of program zcl_falv=>c_fscr_repid excluding excluded_buttons.
    else.
      set pf-status 'STATUS_0200' of program zcl_falv=>c_fscr_repid excluding excluded_buttons.
    endif.
  endmethod.


method show_title.
    set titlebar 'TITLE' of program zcl_falv=>c_fscr_repid with iv_text1 iv_text2 iv_text3 iv_text4 iv_text5.
  endmethod.
ENDCLASS.
