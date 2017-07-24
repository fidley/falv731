*----------------------------------------------------------------------*
*  MODULE pbo OUTPUT
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
MODULE pbo OUTPUT.
*Begin SMD
*  assign outputs[ table_line->guid = current_guid ] to <out>.
  READ TABLE outputs ASSIGNING <out> WITH KEY table_line->guid = current_guid.
*End SMD
  IF sy-subrc EQ 0.
    <out>->pbo( iv_dynnr = sy-dynnr ).
  ENDIF.

ENDMODULE.                    "pbo OUTPUT

*----------------------------------------------------------------------*
*  MODULE pai INPUT
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
MODULE pai INPUT.
*Begin SMD
*  assign outputs[ table_line->guid = current_guid ] to <out>.
  READ TABLE outputs ASSIGNING <out> WITH KEY table_line->guid = current_guid.
*End SMD
  IF sy-subrc EQ 0.
    <out>->pai( CHANGING c_ucomm = okcode  ).
  ENDIF.
ENDMODULE.                    "pai INPUT
