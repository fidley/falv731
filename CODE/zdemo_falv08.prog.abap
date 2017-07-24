"! This is demo for FALV with mass replace function
"! done by Lukasz Pegiel for http://abapblog.com
REPORT zdemo_falv08.

DATA: sflight TYPE STANDARD TABLE OF sflight.


START-OF-SELECTION.


  SELECT * UP TO 100 ROWS
*Begin SMD
*  INTO CORRESPONDING FIELDS OF TABLE @sflight
  INTO CORRESPONDING FIELDS OF TABLE sflight
*End SMD
  FROM sflight.

  "FALV creation with only table passed
*Begom SMD
  DATA: falv TYPE REF TO zcl_falv.
*  data(falv) = zcl_falv=>create( changing ct_table = sflight ).
  zcl_falv=>create( CHANGING ct_table = sflight rv_falv = falv ).
*End SMD

  "Add title variable
  falv->title_v1 = 'ZDEMO_FALV08'.

  "set whole grid editable
  falv->layout->set_edit( abap_true ).
  falv->set_editable( iv_modify = abap_true ).

  "show default grid toolbar
  falv->layout->set_no_toolbar( abap_false ).

  "Add mass replace function to grid toolbar (can be also added to GUI STATUS as well )
  falv->add_button(
    EXPORTING
      iv_function  = falv->fc_mass_replace
       iv_icon      = icon_replace
*      iv_quickinfo =
*      iv_butn_type =
*      iv_disabled  =
       iv_text      = 'Mass replace'
*      iv_checked   =
  ).

  "Display full screen grid
  falv->display( ).
