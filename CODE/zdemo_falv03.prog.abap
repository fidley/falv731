"! This is demo for FALV full screen with partly dynamic GUI STATUS
"! done by Lukasz Pegiel for http://abapblog.com
REPORT zdemo_falv03.

DATA: sflight TYPE STANDARD TABLE OF sflight.

*----------------------------------------------------------------------*
*       CLASS lcl_test DEFINITION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_test DEFINITION INHERITING FROM zcl_falv.
  PUBLIC SECTION.

  PROTECTED SECTION.
    "redefinition of event handler
    METHODS evf_user_command REDEFINITION.
  PRIVATE SECTION.

ENDCLASS.                    "lcl_test DEFINITION

*----------------------------------------------------------------------*
*       CLASS lcl_test IMPLEMENTATION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_test IMPLEMENTATION.

  METHOD evf_user_command.
    CASE e_ucomm.
      WHEN zcl_falv_dynamic_status=>b_01.
        CALL FUNCTION 'POPUP_DISPLAY_MESSAGE'
          EXPORTING
            titel = 'Popup'   " Title
            msgid = '00'
            msgty = 'S'
            msgno = '001'
            msgv1 = 'Button 1 clicked'.
      WHEN zcl_falv_dynamic_status=>b_02.
        CALL FUNCTION 'POPUP_DISPLAY_MESSAGE'
          EXPORTING
            titel = 'Popup'   " Title
            msgid = '00'
            msgty = 'S'
            msgno = '001'
            msgv1 = 'Button 2 clicked'.
    ENDCASE.
  ENDMETHOD.                    "evt_user_command
ENDCLASS.                    "lcl_test IMPLEMENTATION

START-OF-SELECTION.


  SELECT * UP TO 100 ROWS
*Begin SMD
*  into corresponding fields of table @sflight
INTO CORRESPONDING FIELDS OF TABLE sflight
*End SMD
  FROM sflight.

  "creation of falv with local redefinition
  DATA falv TYPE REF TO lcl_test.
*Begin SMD
*  falv ?= lcl_test=>create( exporting  i_subclass = cl_abap_classdescr=>describe_by_name( p_name = 'LCL_TEST' )
*                              changing ct_table = sflight    ) .
  DATA: lo_falv TYPE REF TO zcl_falv.
  lcl_test=>create( EXPORTING  i_subclass = cl_abap_classdescr=>describe_by_name( p_name = 'LCL_TEST' )
                              CHANGING ct_table = sflight  rv_falv = lo_falv  ) .
  falv ?= lo_falv.
*End SMD
  "Add title variable
  falv->title_v1 = 'ZDEMO_FALV03'.

  "Add button into GUI status at for function F01 (in partial dynamic GUI Status we can have up to 19 buttons)
  falv->gui_status->add_button(
    EXPORTING
      iv_button              = zcl_falv_dynamic_status=>b_01
      iv_text                = 'POPUP 01'
      iv_icon                = icon_abc
*      iv_qinfo               =
*      iv_allowed             = ABAP_TRUE
    EXCEPTIONS
      button_already_filled  = 1
      button_does_not_exists = 2
      icon_and_text_empty    = 3
      OTHERS                 = 4
  ).
  IF sy-subrc <> 0.
  ENDIF.

  "Add button into GUI status at for function F02
  falv->gui_status->add_button(
    EXPORTING
      iv_button              = zcl_falv_dynamic_status=>b_02
      iv_text                = 'POPUP 02'
      iv_icon                = icon_address
*      iv_qinfo               =
*      iv_allowed             = ABAP_TRUE
    EXCEPTIONS
      button_already_filled  = 1
      button_does_not_exists = 2
      icon_and_text_empty    = 3
      OTHERS                 = 4
  ).
  IF sy-subrc <> 0.
  ENDIF.

  "Display full screen grid
  falv->display( ).
