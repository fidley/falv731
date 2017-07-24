"! This is demo for FALV with cell settings
"! done by Lukasz Pegiel for http://abapblog.com
REPORT zdemo_falv09.

TYPES: BEGIN OF t_sflight.
        INCLUDE TYPE sflight.
TYPES:  styles TYPE lvc_t_styl,
        END OF t_sflight.

DATA: sflight TYPE STANDARD TABLE OF t_sflight.


*----------------------------------------------------------------------*
*       CLASS lcl_test DEFINITION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_test DEFINITION INHERITING FROM zcl_falv.
  PUBLIC SECTION.

  PROTECTED SECTION.
    "redefinition of event handler
    METHODS evf_hotspot_click REDEFINITION.
  PRIVATE SECTION.

ENDCLASS.                    "lcl_test DEFINITION

*----------------------------------------------------------------------*
*       CLASS lcl_test IMPLEMENTATION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_test IMPLEMENTATION.

  METHOD evf_hotspot_click.
    CASE e_column_id-fieldname.
      WHEN 'SEATSMAX'.
        me->set_cell_disabled(
          EXPORTING
            iv_fieldname = e_column_id-fieldname
            iv_row       = es_row_no-row_id
        ).
        me->set_cell_button(
          EXPORTING
            iv_fieldname = 'PRICE'
            iv_row       = es_row_no-row_id
        ).

        me->set_cell_hotspot(
          EXPORTING
            iv_fieldname = 'CARRID'
            iv_row       = es_row_no-row_id
        ).

        me->soft_refresh( ).
    ENDCASE.
  ENDMETHOD.                    "evt_hotspot_click

ENDCLASS.                    "lcl_test IMPLEMENTATION

START-OF-SELECTION.

  SELECT * UP TO 100 ROWS
*Begin SMD
*  INTO CORRESPONDING FIELDS OF TABLE @sflight
  INTO CORRESPONDING FIELDS OF TABLE sflight
*End SMD
  FROM sflight.

  "creation of falv with local redefinition
  DATA falv TYPE REF TO lcl_test.
*Begin SMD
  DATA: lo_falv TYPE REF TO zcl_falv.
*  falv ?= lcl_test=>create( exporting  i_subclass = cl_abap_classdescr=>describe_by_name( p_name = 'LCL_TEST' )
*                              changing ct_table = sflight    ) .
  lcl_test=>create( EXPORTING  i_subclass = cl_abap_classdescr=>describe_by_name( p_name = 'LCL_TEST' )
                              CHANGING ct_table = sflight  rv_falv = lo_falv  ) .
  falv ?= lo_falv.
*End SMD


  "Add title variable
  falv->title_v1 = 'ZDEMO_FALV09'.

  "set whole grid editable
  falv->layout->set_edit( abap_true ).
  falv->set_editable( iv_modify = abap_true ).

  "Set style column name
  falv->layout->set_stylefname( 'STYLES' ).

  falv->column( 'SEATSMAX' )->set_hotspot( abap_true  ).

  "Display full screen grid
  falv->display( ).
