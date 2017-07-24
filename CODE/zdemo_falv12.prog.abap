"! This is demo for FALV with error log
"! done by Lukasz Pegiel for http://abapblog.com
REPORT zdemo_falv12.

DATA: sflight TYPE STANDARD TABLE OF sflight.


PARAMETERS: p_embeed RADIOBUTTON GROUP gr1 DEFAULT 'X',
            p_notemb RADIOBUTTON GROUP gr1.


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
*End SMD
  IF p_embeed EQ abap_true.
*Begin SMD
*   data(falv) = zcl_falv=>create( exporting i_applog_embedded = abap_true  changing ct_table = sflight ).
    zcl_falv=>create( EXPORTING i_applog_embedded = abap_true  CHANGING ct_table = sflight rv_falv = falv ).
*End SMD
  ELSE.
*Begin SMD
*   falv = zcl_falv=>create( changing ct_table = sflight ).
    zcl_falv=>create( CHANGING ct_table = sflight rv_falv = falv ).
*End SMD
  ENDIF.
  "Add title variable
  falv->title_v1 = 'ZDEMO_FALV12'.

  "set whole grid editable
  falv->layout->set_edit( abap_true ).
  "Change grid to edit mode
  falv->set_editable( iv_modify = abap_true ).

  "Display full screen grid
  falv->display( ).
