"! This is demo for FALV standard fast call
"! done by Lukasz Pegiel for http://abapblog.com
REPORT zdemo_falv01.

DATA: sflight TYPE STANDARD TABLE OF sflight.


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
  falv->title_v1 = 'ZDEMO_FALV01'.

  "Display full screen grid
  falv->display( ).
