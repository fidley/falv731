"! This is demo for FALV with redefinition of hotspot event handler
"! done by Lukasz Pegiel for http://abapblog.com
REPORT zdemo_falv02.

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
        CALL FUNCTION 'POPUP_DISPLAY_MESSAGE'
          EXPORTING
            titel = 'Hotspot is working'   " Title
            msgid = '00'
            msgty = 'I'
            msgno = '001'
            msgv1 = 'Yupi!'.
    ENDCASE.
  ENDMETHOD.                    "evt_hotspot_click

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
*                              CHANGING ct_table = sflight    ) .
  DATA: lo_falv TYPE REF TO zcl_falv.
  lcl_test=>create( EXPORTING  i_subclass = cl_abap_classdescr=>describe_by_name( p_name = 'LCL_TEST' )
                              CHANGING ct_table = sflight rv_falv = lo_falv    ) .
  falv ?= lo_falv.
*End SMD

  "Add hotspot to column 'SEATSMAX'
  falv->column( 'SEATSMAX' )->set_hotspot( abap_true ).
  "Add title variable
  falv->title_v1 = 'ZDEMO_FALV02'.
  "Display full screen grid
  falv->display( ).
