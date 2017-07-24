"! This is demo for FALV standard fast call of pppup
"! done by Lukasz Pegiel for http://abapblog.com
REPORT zdemo_falv14.

DATA: sflight TYPE STANDARD TABLE OF sflight.


PARAMETERS: p_defau  RADIOBUTTON GROUP gr1 DEFAULT 'X',
            p_set    RADIOBUTTON GROUP gr1,
            p_rowst  TYPE i,
            p_rowend TYPE i,
            p_colst  TYPE i,
            p_colend TYPE i.

START-OF-SELECTION.


  SELECT * UP TO 100 ROWS
*Begin SMD
*  INTO CORRESPONDING FIELDS OF TABLE @sflight
  INTO CORRESPONDING FIELDS OF TABLE sflight
*End SMD
  FROM sflight.

  "FALV creation with only table passed
*Begin SMD
*  data(falv) = zcl_falv=>create( exporting i_popup = abap_true changing ct_table = sflight ).
  DATA: falv TYPE REF TO zcl_falv.
  zcl_falv=>create( EXPORTING i_popup = abap_true CHANGING ct_table = sflight rv_falv = falv ).
*End SMD

  "Add title variable
  falv->title_v1 = 'ZDEMO_FALV14'.

  IF p_defau EQ abap_true.
    "Display popup with default size
    falv->display( ).
  ELSE.
    "display popup with customized size
    falv->display(
        iv_start_row    = p_rowst
        iv_start_column = p_colst
        iv_end_row      = p_rowend
        iv_end_column   = p_colend
    ).
  ENDIF.
