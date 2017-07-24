"! This is demo for FALV full screen with color settings
"! done by Lukasz Pegiel for http://abapblog.com

REPORT zdemo_falv10.

TYPES: BEGIN OF t_sflight.
        INCLUDE TYPE sflight.
TYPES:  cell_color TYPE lvc_t_scol,
        row_color  TYPE char4,
        END OF t_sflight.

DATA: sflight TYPE STANDARD TABLE OF t_sflight.

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
  falv->title_v1 = 'ZDEMO_FALV10'.


  "Changing some of field catalog settings for column colors
  falv->column( 'SEATSMAX' )->set_color( 'C700' ).

  "setting of color fields -> this must be done before calling
  "set_row_colors or set_cell_color
  falv->layout->set_ctab_fname( 'CELL_COLOR' ).
  falv->layout->set_info_fname( 'ROW_COLOR'  ).

  "change some row colors
  DO 10 TIMES.
    falv->set_row_color(
      EXPORTING
        iv_color = 'C300'
        iv_row   = 2 * sy-index
    ).
  ENDDO.

  "change some cell colors.
*Begin SMD
  DATA: ls_color TYPE lvc_s_colo.
  ls_color-col = 5.
  ls_color-int = 0.
  ls_color-inv = 0.

*End SMD
  DO 10 TIMES.
    falv->set_cell_color(
      EXPORTING
        iv_fieldname = 'PLANETYPE'
*Begin SMD
*        iv_color     = value #( col = 5 int = 0 inv = 0  )
iv_color     = ls_color
*End SMD
        iv_row       = 3 * sy-index
    ).

  ENDDO.



  "Display full screen grid
  falv->display( ).
