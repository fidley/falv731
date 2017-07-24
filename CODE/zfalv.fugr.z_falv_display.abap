FUNCTION Z_FALV_DISPLAY.
*"--------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(IO_FALV) TYPE REF TO ZCL_FALV
*"     VALUE(IV_START_ROW) TYPE  I OPTIONAL
*"     VALUE(IV_START_COLUMN) TYPE  I OPTIONAL
*"     VALUE(IV_END_ROW) TYPE  I OPTIONAL
*"     VALUE(IV_END_COLUMN) TYPE  I OPTIONAL
*"--------------------------------------------------------------------
*Begin SMD
  DATA: output TYPE REF TO lcl_output.
  FIELD-SYMBOLS: <output> LIKE LINE OF outputs.
*if not line_exists( outputs[ table_line->falv = io_falv ] ).
  READ TABLE outputs ASSIGNING <output> WITH KEY table_line->falv = io_falv.
  IF sy-subrc NE 0.
*        data(output) = new lcl_output( io_falv ).
    CREATE OBJECT output
      EXPORTING
        io_falv = io_falv.
*End SMD
    INSERT output INTO TABLE outputs.
    current_guid = output->guid.
    ASSIGN output TO <out>.
    IF sy-subrc EQ 0.

    ENDIF.

  ELSE.
*Begin SMD
*    ASSIGN outputs[ table_line->falv = io_falv ] TO <out>.
    READ TABLE outputs ASSIGNING <output> WITH KEY table_line->falv = io_falv.
    IF sy-subrc EQ 0.
      ASSIGN <output> TO <out>.
*End SMD
      IF sy-subrc EQ 0.
        current_guid = <out>->guid.
      ENDIF.
*Begin SMD
    ENDIF.
*End SMD
  ENDIF.

  IF io_falv->screen EQ io_falv->c_screen_popup.
    CALL SCREEN io_falv->screen STARTING AT  iv_start_column iv_start_row
                                ENDING AT    iv_end_column iv_end_row
                                .
  ELSE.
    CALL SCREEN io_falv->screen.
  ENDIF.





ENDFUNCTION.
