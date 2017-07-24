"! This is demo for FALV full screen with fieldcatalog update
"! done by Lukasz Pegiel for http://abapblog.com

REPORT zdemo_falv07.

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
*Emd SMD

  "Add title variable
  falv->title_v1 = 'ZDEMO_FALV07'.


  "Changing some of field catalog settings
  falv->column( 'SEATSMAX' )->set_hotspot( abap_true ).
  falv->column( 'SEATSMAX' )->set_color( 'C700' ).

  falv->column( 'PLANETYPE' )->set_color( 'C300' ).
  falv->column( 'PLANETYPE' )->set_no_merging( abap_true ).

  falv->column( 'PAYMENTSUM' )->set_no_zero( abap_true ).

  "or

*Begin SMD
  DATA: price TYPE REF TO zcl_falv_column.
*  data(price) = falv->column( 'PRICE' ).
  price = falv->column( 'PRICE' ).
*End SMD
  price->set_no_out( abap_true ).
*Begin SMD
  DATA: occup TYPE REF TO zcl_falv_column.
*  data(occup) = falv->column( 'SEATSOCC' ).
  occup = falv->column( 'SEATSOCC' ).
*End SMD
  occup->set_no_zero( abap_true ).
  occup->set_no_merging( abap_true  ).



  "Display full screen grid
  falv->display( ).
