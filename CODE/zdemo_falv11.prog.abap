"! This is demo for FALV with edit settings
"! done by Lukasz Pegiel for http://abapblog.com
REPORT zdemo_falv11.

TYPES: BEGIN OF t_sflight.
        INCLUDE TYPE sflight.
TYPES:  styles TYPE lvc_t_styl,
        END OF t_sflight.

DATA: sflight TYPE STANDARD TABLE OF t_sflight.


PARAMETERS: p_whole  RADIOBUTTON GROUP gr1 DEFAULT 'X',
            p_column RADIOBUTTON GROUP gr1,
            p_cell   RADIOBUTTON GROUP gr1.


START-OF-SELECTION.


  SELECT * UP TO 100 ROWS
*Begin SMD
*  INTO CORRESPONDING FIELDS OF TABLE @sflight
  INTO CORRESPONDING FIELDS OF TABLE sflight
*End SMD
  FROM sflight.

  "FALV creation with only table passed

*Begin SMD
  DATA: falv TYPE REF TO zcl_falv.
*  data(falv) = zcl_falv=>create( changing ct_table = sflight ).
  zcl_falv=>create( CHANGING ct_table = sflight rv_falv = falv ).
*End SMD

  "Add title variable
  falv->title_v1 = 'ZDEMO_FALV11'.

  IF p_whole EQ abap_true.
    "set whole grid editable
    falv->layout->set_edit( abap_true ).
  ELSEIF p_column EQ abap_true.
    falv->column( 'SEATSMAX' )->set_edit( abap_true ).
    falv->column( 'PLANETYPE' )->set_edit( abap_true ).
  ELSE.
    "Set style column name
    falv->layout->set_stylefname( 'STYLES' ).
    DO 20 TIMES.
      falv->set_cell_enabled(
        EXPORTING
          iv_fieldname = 'FLDATE'
          iv_row       = 2 * sy-index
          ).
    ENDDO.
  ENDIF.

  "Change grid to edit mode
  falv->set_editable( iv_modify = abap_true ).

  "Display full screen grid
  falv->display( ).
