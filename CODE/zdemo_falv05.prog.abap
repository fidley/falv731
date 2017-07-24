"! This is demo for FALV grid button adding, deleting, enabling, disabling
"! done by Lukasz Pegiel for http://abapblog.com
REPORT zdemo_falv05.


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
        me->enable_button( me->mc_fc_print_back ).
      WHEN zcl_falv_dynamic_status=>b_02.
        me->disable_button( me->mc_fc_print_back ).
        me->add_button(
          EXPORTING
            iv_function  = zcl_falv_dynamic_status=>b_03
             iv_icon      = icon_alarm
        ).
      WHEN zcl_falv_dynamic_status=>b_03.
        me->delete_button( zcl_falv_dynamic_status=>b_03 ).
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
  DATA: lo_falv TYPE REF TO zcl_falv.
*  falv ?= lcl_test=>create( exporting  i_subclass = cl_abap_classdescr=>describe_by_name( p_name = 'LCL_TEST' )
*                              changing ct_table = sflight    ) .
  lcl_test=>create( exporting  i_subclass = cl_abap_classdescr=>describe_by_name( p_name = 'LCL_TEST' )
                              CHANGING ct_table = sflight  rv_falv = lo_falv  ) .
  falv ?= lo_falv.
*End SMD

  "Add title variable
  falv->title_v1 = 'ZDEMO_FALV05'.

  "Set Gui status to fully dynamic (no standard buttons of ALV Grid)
  falv->gui_status->fully_dynamic = abap_true.

  "Add button into GUI status at for function F01 (in partial dynamic GUI Status we can have up to 19 buttons)
  falv->gui_status->add_button(
    EXPORTING
      iv_button              = zcl_falv_dynamic_status=>b_01
      iv_text                = 'Enable Print'
      iv_icon                = icon_activate
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
      iv_text                = 'Disable Print'
      iv_icon                = icon_active_inactive
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


  "In default when we use full screen FALV, Grid toolbar is switched off, we must turn it on )
  falv->layout->set_no_toolbar( abap_false ).

  "we Add buttons to ALV grid toolbar, I'll use same function like in GUI status
  falv->add_button(
    EXPORTING
      iv_function  = zcl_falv_dynamic_status=>b_01
      iv_icon      = icon_activate
*      iv_quickinfo =
*      iv_butn_type =
*      iv_disabled  =
       iv_text      = 'Enable Print'
*      iv_checked   =
  ).
  "we Add buttons to ALV grid toolbar, I'll use same function like in GUI status
  falv->add_button(
    EXPORTING
      iv_function  = zcl_falv_dynamic_status=>b_02
      iv_icon      = icon_active_inactive
*      iv_quickinfo =
*      iv_butn_type =
*      iv_disabled  =
       iv_text      = 'Disable Print'
*      iv_checked   =
  ).

  "remove button "Details" & "Info" from standard Grid functions
  falv->delete_button( falv->mc_fc_detail ).
  falv->delete_button( falv->mc_fc_info ).
  "Display full screen grid
  falv->display( ).
