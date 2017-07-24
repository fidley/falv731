"! This is demo for FALV Mix Demo. It contains many features, many FALVs in one program
"! and a usage of a own screen with own container and FALV
"! done by Lukasz Pegiel for http://abapblog.com
REPORT zdemo_falv13.

TYPES: BEGIN OF t_sflight.
        INCLUDE TYPE sflight.
TYPES: style TYPE lvc_t_styl,
       END OF t_sflight.

DATA: sflight TYPE STANDARD TABLE OF t_sflight.
SELECT * UP TO 100 ROWS
*Begin SMD
*  INTO CORRESPONDING FIELDS OF TABLE @sflight
  INTO CORRESPONDING FIELDS OF TABLE sflight
*End SMD
  FROM sflight.

*----------------------------------------------------------------------*
*       CLASS lcl_test DEFINITION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_test DEFINITION INHERITING FROM zcl_falv.
  PUBLIC SECTION.

  PROTECTED SECTION.
    METHODS evf_at_set_title REDEFINITION.
  PRIVATE SECTION.

ENDCLASS.                    "lcl_test DEFINITION

*----------------------------------------------------------------------*
*       CLASS lcl_test IMPLEMENTATION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_test IMPLEMENTATION.

  METHOD evf_at_set_title.

  ENDMETHOD.                    "evt_at_set_title

ENDCLASS.                    "lcl_test IMPLEMENTATION

DATA: falv_screen TYPE REF TO lcl_test.
DATA: ok_code TYPE sy-ucomm.


START-OF-SELECTION.
  "creation of falv with local redefinition
  DATA falv_redef TYPE REF TO lcl_test.
*Begin SMD
*  falv_redef ?= lcl_test=>create( exporting i_applog_embedded = abap_false  i_popup = abap_true
*                              i_subclass = cl_abap_classdescr=>describe_by_name( p_name = 'LCL_TEST' )
*                              changing ct_table = sflight    ) .
  DATA: lo_falv TYPE REF TO zcl_falv.
  lcl_test=>create( EXPORTING i_applog_embedded = abap_false  i_popup = abap_true
                              i_subclass = cl_abap_classdescr=>describe_by_name( p_name = 'LCL_TEST' )
                              CHANGING ct_table = sflight  rv_falv = lo_falv  ) .
  falv_redef ?= lo_falv.
*Emd SMD

  falv_redef->add_button(
    EXPORTING
      iv_function  = 'F111'
      iv_icon      = icon_refresh
      iv_butn_type = zcl_falv=>button_normal
  ).
  falv_redef->delete_button( zcl_falv=>mc_fc_detail ).
  falv_redef->display( ).
  "creation of standard falv
*Begin SMD
*  data(falv_stand) = zcl_falv=>create( exporting i_applog_embedded = abap_true changing ct_table = sflight   ).
  DATA: falv_stand TYPE REF TO zcl_falv.
  zcl_falv=>create( EXPORTING i_applog_embedded = abap_true CHANGING ct_table = sflight rv_falv = falv_stand  ).
*End SMD

  falv_stand->gui_status->add_button(
    EXPORTING
      iv_button              = falv_stand->gui_status->b_15
      iv_text                = 'F15'
      iv_icon                = icon_refresh
      iv_qinfo               = 'Test d'
      iv_allowed             = abap_true
    EXCEPTIONS
      button_already_filled  = 1
      button_does_not_exists = 2
      icon_and_text_empty    = 3
      OTHERS                 = 4
  ).
  IF sy-subrc <> 0.
*   message id sy-msgid type sy-msgty number sy-msgno
*              with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  ENDIF.
  falv_stand->gui_status->add_button(
  EXPORTING
    iv_button              = falv_stand->gui_status->b_16
    iv_text                = 'F16'
    iv_icon                = icon_refresh
    iv_qinfo               = 'Test d'
    iv_allowed             = abap_true
  EXCEPTIONS
    button_already_filled  = 1
    button_does_not_exists = 2
    icon_and_text_empty    = 3
    OTHERS                 = 4
).
  IF sy-subrc <> 0.
*   message id sy-msgid type sy-msgty number sy-msgno
*              with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  ENDIF.

  falv_stand->gui_status->add_button(
  EXPORTING
    iv_button              = falv_stand->gui_status->b_17
    iv_text                = 'F17'
    iv_icon                = icon_refresh
    iv_qinfo               = 'Test d'
    iv_allowed             = abap_true
  EXCEPTIONS
    button_already_filled  = 1
    button_does_not_exists = 2
    icon_and_text_empty    = 3
    OTHERS                 = 4
).
  IF sy-subrc <> 0.
*   message id sy-msgid type sy-msgty number sy-msgno
*              with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  ENDIF.

  falv_stand->gui_status->add_button(
EXPORTING
  iv_button              = falv_stand->gui_status->b_18
  iv_text                = 'F18'
  iv_icon                = icon_refresh
  iv_qinfo               = 'Test d'
  iv_allowed             = abap_true
EXCEPTIONS
  button_already_filled  = 1
  button_does_not_exists = 2
  icon_and_text_empty    = 3
  OTHERS                 = 4
).
  IF sy-subrc <> 0.
*   message id sy-msgid type sy-msgty number sy-msgno
*              with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  ENDIF.

  falv_stand->gui_status->add_button(
EXPORTING
  iv_button              = falv_stand->gui_status->b_19
  iv_text                = 'F19'
  iv_icon                = icon_refresh
  iv_qinfo               = 'Test d'
  iv_allowed             = abap_true
EXCEPTIONS
  button_already_filled  = 1
  button_does_not_exists = 2
  icon_and_text_empty    = 3
  OTHERS                 = 4
).
  IF sy-subrc <> 0.
*   message id sy-msgid type sy-msgty number sy-msgno
*              with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  ENDIF.

  falv_stand->gui_status->add_button(
EXPORTING
  iv_button              = falv_stand->gui_status->b_13
  iv_text                = 'F13'
  iv_icon                = icon_refresh
  iv_qinfo               = 'Test d'
  iv_allowed             = abap_true
EXCEPTIONS
  button_already_filled  = 1
  button_does_not_exists = 2
  icon_and_text_empty    = 3
  OTHERS                 = 4
).
  IF sy-subrc <> 0.
*   message id sy-msgid type sy-msgty number sy-msgno
*              with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  ENDIF.

  falv_stand->gui_status->add_button(
  EXPORTING
    iv_button              = falv_stand->gui_status->b_14
    iv_text                = 'F14'
    iv_icon                = icon_refresh
    iv_qinfo               = 'Test d'
    iv_allowed             = abap_true
  EXCEPTIONS
    button_already_filled  = 1
    button_does_not_exists = 2
    icon_and_text_empty    = 3
    OTHERS                 = 4
).
  IF sy-subrc <> 0.
*   message id sy-msgid type sy-msgty number sy-msgno
*              with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  ENDIF.


  falv_stand->display( ).

  "copy of standard falv + some changes of descriptions
*Begin SMD
*  data(falv_stand_copy) = falv_stand->create_by_copy(  ).
  DATA: falv_stand_copy TYPE REF TO zcl_falv.
  falv_stand_copy = falv_stand->create_by_copy(  ).
*End SMD
  falv_stand_copy->column( 'CARRID' )->set_scrtext_l( 'test' ).
  falv_stand_copy->column( 'CARRID' )->set_scrtext_m( 'test' ).
  falv_stand_copy->column( 'CARRID' )->set_scrtext_s( 'test' ).
  falv_stand_copy->column( 'CARRID' )->set_reptext( 'test' ).
  falv_stand_copy->variant-report = sy-repid.
  falv_stand_copy->layout_save = 'X'.
  falv_stand_copy->layout->set_zebra( abap_true  ).
  falv_stand_copy->display( ).

  "copy of falv with own local redefinitions
*Begin SMD
*  data(falv_redef_copy) = falv_redef->create_by_copy(  ).
  DATA: falv_redef_copy TYPE REF TO zcl_falv.
  falv_redef_copy = falv_redef->create_by_copy(  ).
*End SMD
  falv_redef_copy->display( ).

  falv_stand->display( ).

  falv_stand_copy->display( ).

  falv_redef_copy->column( 'SEATSMAX' )->set_edit( abap_true ).
  falv_redef_copy->layout->set_edit( abap_true ).
  falv_redef_copy->set_editable( ).
  falv_redef_copy->layout->set_stylefname( 'STYLE' ).
  falv_redef_copy->set_cell_disabled(
    EXPORTING
      iv_fieldname = 'SEATSMAX'
      iv_row       = 1
  ).
  falv_redef_copy->add_button(
    EXPORTING
      iv_function  = zcl_falv=>fc_mass_replace
      iv_icon      = icon_replace
  ).
  falv_redef_copy->refresh_table_display( ).
  falv_redef_copy->display( ).

  falv_stand->display( ).

  falv_redef_copy->display( ).

  CALL SCREEN 100.
*&---------------------------------------------------------------------*
*&      Module  PBO  OUTPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE pbo OUTPUT.
  SET PF-STATUS 'DYNAMIC_STATUS_PART' OF PROGRAM 'SAPLZFALV'.
  IF falv_screen IS INITIAL.
*Begin SMD
*    falv_screen ?= lcl_test=>create( exporting
*      i_parent = NEW cl_gui_custom_container( container_name = 'CC_MAIN' )
*      i_subclass = cl_abap_classdescr=>describe_by_name( p_name = 'LCL_TEST' )
*      CHANGING ct_table = sflight    ) .
    DATA: lo_falv2 TYPE REF TO zcl_falv,
          lo_container TYPE REF TO cl_gui_custom_container.
    CREATE OBJECT lo_container
      EXPORTING
        container_name = 'CC_MAIN'.
    lcl_test=>create( EXPORTING
      i_parent = lo_container
      i_subclass = cl_abap_classdescr=>describe_by_name( p_name = 'LCL_TEST' )
      CHANGING ct_table = sflight  rv_falv = lo_falv2  ) .
    falv_screen ?=   lo_falv2.
*End SMD
    falv_screen->column( 'CARRID' )->set_reptext( 'test' ).
    falv_screen->display( ).
  ENDIF.
ENDMODULE.                    "pbo OUTPUT

*----------------------------------------------------------------------*
*  MODULE pai INPUT
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
MODULE pai INPUT.
  falv_screen->pai(
    EXPORTING
      iv_dynnr = sy-dynnr
    CHANGING
      c_ucomm  = ok_code
  ).

ENDMODULE.                    "pai INPUT
