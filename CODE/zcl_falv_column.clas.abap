class ZCL_FALV_COLUMN definition
  public
  create public .

public section.
*"* public components of class ZCL_FALV_COLUMN
*"* do not include other source files here!!!

  data FIELDNAME type LVC_S_FCAT-FIELDNAME read-only .

  methods CONSTRUCTOR
    importing
      value(IV_FIELDNAME) type LVC_S_FCAT-FIELDNAME
      !IO_FALV type ref to ZCL_FALV .
  methods SET_EDITABLE .
  methods SET_READONLY .
  methods SET_ROW_POS
    importing
      value(IV_VALUE) type LVC_ROWPOS .
  methods SET_COL_POS
    importing
      value(IV_VALUE) type LVC_COLPOS .
  methods SET_FIELDNAME
    importing
      value(IV_VALUE) type LVC_FNAME .
  methods SET_TABNAME
    importing
      value(IV_VALUE) type LVC_TNAME .
  methods SET_CURRENCY
    importing
      value(IV_VALUE) type LVC_CURR .
  methods SET_CFIELDNAME
    importing
      value(IV_VALUE) type LVC_CFNAME .
  methods SET_QUANTITY
    importing
      value(IV_VALUE) type LVC_QUAN .
  methods SET_QFIELDNAME
    importing
      value(IV_VALUE) type LVC_QFNAME .
  methods SET_IFIELDNAME
    importing
      value(IV_VALUE) type LVC_FNAME .
  methods SET_ROUND
    importing
      value(IV_VALUE) type LVC_ROUND .
  methods SET_EXPONENT
    importing
      value(IV_VALUE) type LVC_EXPONT .
  methods SET_KEY
    importing
      value(IV_VALUE) type LVC_KEY .
  methods SET_KEY_SEL
    importing
      value(IV_VALUE) type LVC_KEYSEL .
  methods SET_ICON
    importing
      value(IV_VALUE) type LVC_ICON .
  methods SET_SYMBOL
    importing
      value(IV_VALUE) type LVC_SYMBOL .
  methods SET_CHECKBOX
    importing
      value(IV_VALUE) type LVC_CHECKB .
  methods SET_JUST
    importing
      value(IV_VALUE) type LVC_JUST .
  methods SET_LZERO
    importing
      value(IV_VALUE) type LVC_LZERO .
  methods SET_NO_SIGN
    importing
      value(IV_VALUE) type LVC_NOSIGN .
  methods SET_NO_ZERO
    importing
      value(IV_VALUE) type LVC_NOZERO .
  methods SET_NO_CONVEXT
    importing
      value(IV_VALUE) type LVC_NOCONV .
  methods SET_EDIT_MASK
    importing
      value(IV_VALUE) type LVC_EDTMSK .
  methods SET_EMPHASIZE
    importing
      value(IV_VALUE) type LVC_EMPHSZ .
  methods SET_COLOR
    importing
      value(IV_VALUE) type LVC_EMPHSZ .
  methods SET_FIX_COLUMN
    importing
      value(IV_VALUE) type LVC_FIXCOL .
  methods SET_DO_SUM
    importing
      value(IV_VALUE) type LVC_DOSUM .
  methods SET_NO_SUM
    importing
      value(IV_VALUE) type LVC_NOSUM .
  methods SET_NO_OUT
    importing
      value(IV_VALUE) type LVC_NOOUT .
  methods SET_TECH
    importing
      value(IV_VALUE) type LVC_TECH .
  methods SET_OUTPUTLEN
    importing
      value(IV_VALUE) type LVC_OUTLEN .
  methods SET_CONVEXIT
    importing
      value(IV_VALUE) type CONVEXIT .
  methods SET_SELTEXT
    importing
      value(IV_VALUE) type LVC_TXT .
  methods SET_TOOLTIP
    importing
      value(IV_VALUE) type LVC_TIP .
  methods SET_ROLLNAME
    importing
      value(IV_VALUE) type LVC_ROLL .
  methods SET_DATATYPE
    importing
      value(IV_VALUE) type DATATYPE_D .
  methods SET_INTTYPE
    importing
      value(IV_VALUE) type INTTYPE .
  methods SET_INTLEN
    importing
      value(IV_VALUE) type INTLEN .
  methods SET_LOWERCASE
    importing
      value(IV_VALUE) type LOWERCASE .
  methods SET_REPTEXT
    importing
      value(IV_VALUE) type REPTEXT .
  methods SET_HIER_LEVEL
    importing
      value(IV_VALUE) type LVC_HIERL .
  methods SET_REPREP
    importing
      value(IV_VALUE) type LVC_CRPRP .
  methods SET_DOMNAME
    importing
      value(IV_VALUE) type DOMNAME .
  methods SET_SP_GROUP
    importing
      value(IV_VALUE) type LVC_SPGRP .
  methods SET_HOTSPOT
    importing
      value(IV_VALUE) type LVC_HOTSPT .
  methods SET_DFIELDNAME
    importing
      value(IV_VALUE) type LVCDBGFN .
  methods SET_COL_ID
    importing
      value(IV_VALUE) type LVC_COLID .
  methods SET_F4AVAILABL
    importing
      value(IV_VALUE) type DDF4AVAIL .
  methods SET_AUTO_VALUE
    importing
      value(IV_VALUE) type LVC_AUTO .
  methods SET_CHECKTABLE
    importing
      value(IV_VALUE) type TABNAME .
  methods SET_VALEXI
    importing
      value(IV_VALUE) type VALEXI .
  methods SET_WEB_FIELD
    importing
      value(IV_VALUE) type LVC_FNAME .
  methods SET_HREF_HNDL
    importing
      value(IV_VALUE) type INT4 .
  methods SET_STYLE
    importing
      value(IV_VALUE) type LVC_STYLE .
  methods SET_STYLE2
    importing
      value(IV_VALUE) type LVC_STYLE .
  methods SET_STYLE3
    importing
      value(IV_VALUE) type LVC_STYLE .
  methods SET_STYLE4
    importing
      value(IV_VALUE) type LVC_STYLE .
  methods SET_DRDN_HNDL
    importing
      value(IV_VALUE) type INT4 .
  methods SET_DRDN_FIELD
    importing
      value(IV_VALUE) type LVC_FNAME .
  methods SET_NO_MERGING
    importing
      value(IV_VALUE) type CHAR01 .
  methods SET_H_FTYPE
    importing
      value(IV_VALUE) type LVC_FTYPE .
  methods SET_COL_OPT
    importing
      value(IV_VALUE) type LVC_COLOPT .
  methods SET_NO_INIT_CH
    importing
      value(IV_VALUE) type CHAR01 .
  methods SET_DRDN_ALIAS
    importing
      value(IV_VALUE) type CHAR01 .
  methods SET_DECFLOAT_STYLE
    importing
      value(IV_VALUE) type OUTPUTSTYLE .
  methods SET_PARAMETER0
    importing
      value(IV_VALUE) type CHAR30 .
  methods SET_PARAMETER1
    importing
      value(IV_VALUE) type CHAR30 .
  methods SET_PARAMETER2
    importing
      value(IV_VALUE) type CHAR30 .
  methods SET_PARAMETER3
    importing
      value(IV_VALUE) type CHAR30 .
  methods SET_PARAMETER4
    importing
      value(IV_VALUE) type CHAR30 .
  methods SET_PARAMETER5
    importing
      value(IV_VALUE) type INT4 .
  methods SET_PARAMETER6
    importing
      value(IV_VALUE) type INT4 .
  methods SET_PARAMETER7
    importing
      value(IV_VALUE) type INT4 .
  methods SET_PARAMETER8
    importing
      value(IV_VALUE) type INT4 .
  methods SET_PARAMETER9
    importing
      value(IV_VALUE) type INT4 .
  methods SET_REF_FIELD
    importing
      value(IV_VALUE) type LVC_RFNAME .
  methods SET_REF_TABLE
    importing
      value(IV_VALUE) type LVC_RTNAME .
  methods SET_TXT_FIELD
    importing
      value(IV_VALUE) type LVC_FNAME .
  methods SET_ROUNDFIELD
    importing
      value(IV_VALUE) type LVC_RNDFN .
  methods SET_DECIMALS_O
    importing
      value(IV_VALUE) type LVC_DECMLS .
  methods SET_DECMLFIELD
    importing
      value(IV_VALUE) type LVC_DFNAME .
  methods SET_DD_OUTLEN
    importing
      value(IV_VALUE) type LVC_DDLEN .
  methods SET_DECIMALS
    importing
      value(IV_VALUE) type DECIMALS .
  methods SET_COLTEXT
    importing
      value(IV_VALUE) type LVC_TXTCOL .
  methods SET_SCRTEXT_L
    importing
      value(IV_VALUE) type SCRTEXT_L .
  methods SET_SCRTEXT_M
    importing
      value(IV_VALUE) type SCRTEXT_M .
  methods SET_SCRTEXT_S
    importing
      value(IV_VALUE) type SCRTEXT_S .
  methods SET_COLDDICTXT
    importing
      value(IV_VALUE) type LVC_DDICT .
  methods SET_SELDDICTXT
    importing
      value(IV_VALUE) type LVC_DDICT .
  methods SET_TIPDDICTXT
    importing
      value(IV_VALUE) type LVC_DDICT .
  methods SET_EDIT
    importing
      value(IV_VALUE) type LVC_EDIT .
  methods SET_TECH_COL
    importing
      value(IV_VALUE) type LVC_TCOL .
  methods SET_TECH_FORM
    importing
      value(IV_VALUE) type LVC_TFORM .
  methods SET_TECH_COMP
    importing
      value(IV_VALUE) type LVC_TCOMP .
  methods SET_HIER_CPOS
    importing
      value(IV_VALUE) type LVCHCOLPOS .
  methods SET_H_COL_KEY
    importing
      value(IV_VALUE) type TV_ITMNAME .
  methods SET_H_SELECT
    importing
      value(IV_VALUE) type LVC_SELECT .
  methods SET_DD_ROLL
    importing
      value(IV_VALUE) type ROLLNAME .
  methods SET_DRAGDROPID
    importing
      value(IV_VALUE) type LVC_DDID .
  methods SET_MAC
    importing
      value(IV_VALUE) type CHAR01 .
  methods SET_INDX_FIELD
    importing
      value(IV_VALUE) type INT4 .
  methods SET_INDX_CFIEL
    importing
      value(IV_VALUE) type INT4 .
  methods SET_INDX_QFIEL
    importing
      value(IV_VALUE) type INT4 .
  methods SET_INDX_IFIEL
    importing
      value(IV_VALUE) type INT4 .
  methods SET_INDX_ROUND
    importing
      value(IV_VALUE) type INT4 .
  methods SET_INDX_DECML
    importing
      value(IV_VALUE) type INT4 .
  methods SET_GET_STYLE
    importing
      value(IV_VALUE) type CHAR01 .
  methods SET_MARK
    importing
      value(IV_VALUE) type CHAR01 .
protected section.
*"* protected components of class ZCL_FALV_COLUMN
*"* do not include other source files here!!!
private section.
*"* private components of class ZCL_FALV_COLUMN
*"* do not include other source files here!!!

  data FALV type ref to ZCL_FALV .

  methods CHANGE_SETTING
    importing
      value(IV_VALUE) type ANY
      value(IV_SETTING) type STRING .
ENDCLASS.



CLASS ZCL_FALV_COLUMN IMPLEMENTATION.


METHOD change_setting.
  falv->get_frontend_fieldcatalog( IMPORTING et_fieldcatalog = falv->fcat ).
*Begin SMD
*    assign falv->fcat[ fieldname = fieldname ] to field-symbol(<fcat>).
  FIELD-SYMBOLS: <fcat> LIKE LINE OF falv->fcat.
  READ TABLE falv->fcat ASSIGNING <fcat> WITH KEY fieldname = fieldname.
*End SMD
  IF sy-subrc EQ 0.
*Begin SMD
*    data(fcat_field) = |<fcat>-{ iv_setting }|.
*    ASSIGN (fcat_field) TO field-symbol(<field>).
    DATA: fcat_field TYPE string.
    FIELD-SYMBOLS: <field> TYPE any.
    fcat_field = |<fcat>-{ iv_setting }|.
    ASSIGN (fcat_field) TO <field>.
*End SMD
    IF sy-subrc EQ 0.
      <field> = iv_value.
    ENDIF.
    falv->set_frontend_fieldcatalog( it_fieldcatalog = falv->fcat ).
  ENDIF.
ENDMETHOD.


method constructor.
    fieldname = iv_fieldname.
    falv = io_falv.
  endmethod.


method set_auto_value.
    change_setting( iv_value = iv_value iv_setting = 'AUTO_VALUE').
  endmethod.


method set_cfieldname.
    change_setting( iv_value = iv_value iv_setting = 'CFIELDNAME').
  endmethod.


method set_checkbox.
    change_setting( iv_value = iv_value iv_setting = 'CHECKBOX').
  endmethod.


method set_checktable.
    change_setting( iv_value = iv_value iv_setting = 'CHECKTABLE').
  endmethod.


method set_colddictxt.
    change_setting( iv_value = iv_value iv_setting = 'COLDDICTXT').
  endmethod.


method set_color.
    set_emphasize( iv_value = iv_value ).
  endmethod.


method set_coltext.
    change_setting( iv_value = iv_value iv_setting = 'COLTEXT').
  endmethod.


method set_col_id.
    change_setting( iv_value = iv_value iv_setting = 'COL_ID').
  endmethod.


method set_col_opt.
    change_setting( iv_value = iv_value iv_setting = 'COL_OPT').
  endmethod.


method set_col_pos.
    change_setting( iv_value = iv_value iv_setting = 'COL_POS').
  endmethod.


method set_convexit.
    change_setting( iv_value = iv_value iv_setting = 'CONVEXIT').
  endmethod.


method set_currency.
    change_setting( iv_value = iv_value iv_setting = 'CURRENCY').
  endmethod.


method set_datatype.
    change_setting( iv_value = iv_value iv_setting = 'DATATYPE').
  endmethod.


method set_dd_outlen.
    change_setting( iv_value = iv_value iv_setting = 'DD_OUTLEN').
  endmethod.


method set_dd_roll.
    change_setting( iv_value = iv_value iv_setting = 'DD_ROLL').
  endmethod.


method set_decfloat_style.
    change_setting( iv_value = iv_value iv_setting = 'DECFLOAT_STYLE').
  endmethod.


method set_decimals.
    change_setting( iv_value = iv_value iv_setting = 'DECIMALS').
  endmethod.


method set_decimals_o.
    change_setting( iv_value = iv_value iv_setting = 'DECIMALS_O').
  endmethod.


method set_decmlfield.
    change_setting( iv_value = iv_value iv_setting = 'DECMLFIELD').
  endmethod.


method set_dfieldname.
    change_setting( iv_value = iv_value iv_setting = 'DFIELDNAME').
  endmethod.


method set_domname.
    change_setting( iv_value = iv_value iv_setting = 'DOMNAME').
  endmethod.


method set_do_sum.
    change_setting( iv_value = iv_value iv_setting = 'DO_SUM').
  endmethod.


method set_dragdropid.
    change_setting( iv_value = iv_value iv_setting = 'DRAGDROPID').
  endmethod.


method set_drdn_alias.
    change_setting( iv_value = iv_value iv_setting = 'DRDN_ALIAS').
  endmethod.


method set_drdn_field.
    change_setting( iv_value = iv_value iv_setting = 'DRDN_FIELD').
  endmethod.


method set_drdn_hndl.
    change_setting( iv_value = iv_value iv_setting = 'DRDN_HNDL').
  endmethod.


method set_edit.
    change_setting( iv_value = iv_value iv_setting = 'EDIT').
  endmethod.


method set_editable.
    change_setting( iv_value = abap_true iv_setting = 'EDIT').
  endmethod.


method set_edit_mask.
    change_setting( iv_value = iv_value iv_setting = 'EDIT_MASK').
  endmethod.


method set_emphasize.
    change_setting( iv_value = iv_value iv_setting = 'EMPHASIZE').
  endmethod.


method set_exponent.
    change_setting( iv_value = iv_value iv_setting = 'EXPONENT').
  endmethod.


method set_f4availabl.
    change_setting( iv_value = iv_value iv_setting = 'F4AVAILABL').
  endmethod.


method set_fieldname.
    change_setting( iv_value = iv_value iv_setting = 'FIELDNAME').
  endmethod.


method set_fix_column.
    change_setting( iv_value = iv_value iv_setting = 'FIX_COLUMN').
  endmethod.


method set_get_style.
    change_setting( iv_value = iv_value iv_setting = 'GET_STYLE').
  endmethod.


method set_hier_cpos.
    change_setting( iv_value = iv_value iv_setting = 'HIER_CPOS').
  endmethod.


method set_hier_level.
    change_setting( iv_value = iv_value iv_setting = 'HIER_LEVEL').
  endmethod.


method set_hotspot.
    change_setting( iv_value = iv_value iv_setting = 'HOTSPOT').
  endmethod.


method set_href_hndl.
    change_setting( iv_value = iv_value iv_setting = 'HREF_HNDL').
  endmethod.


method set_h_col_key.
    change_setting( iv_value = iv_value iv_setting = 'H_COL_KEY').
  endmethod.


method set_h_ftype.
    change_setting( iv_value = iv_value iv_setting = 'H_FTYPE').
  endmethod.


method set_h_select.
    change_setting( iv_value = iv_value iv_setting = 'H_SELECT').
  endmethod.


method set_icon.
    change_setting( iv_value = iv_value iv_setting = 'ICON').
  endmethod.


method set_ifieldname.
    change_setting( iv_value = iv_value iv_setting = 'IFIELDNAME').
  endmethod.


method set_indx_cfiel.
    change_setting( iv_value = iv_value iv_setting = 'INDX_CFIEL').
  endmethod.


method set_indx_decml.
    change_setting( iv_value = iv_value iv_setting = 'INDX_DECML').
  endmethod.


method set_indx_field.
    change_setting( iv_value = iv_value iv_setting = 'INDX_FIELD').
  endmethod.


method set_indx_ifiel.
    change_setting( iv_value = iv_value iv_setting = 'INDX_IFIEL').
  endmethod.


method set_indx_qfiel.
    change_setting( iv_value = iv_value iv_setting = 'INDX_QFIEL').
  endmethod.


method set_indx_round.
    change_setting( iv_value = iv_value iv_setting = 'INDX_ROUND').
  endmethod.


method set_intlen.
    change_setting( iv_value = iv_value iv_setting = 'INTLEN').
  endmethod.


method set_inttype.
    change_setting( iv_value = iv_value iv_setting = 'INTTYPE').
  endmethod.


method set_just.
    change_setting( iv_value = iv_value iv_setting = 'JUST').
  endmethod.


method set_key.
    change_setting( iv_value = iv_value iv_setting = 'KEY').
  endmethod.


method set_key_sel.
    change_setting( iv_value = iv_value iv_setting = 'KEY_SEL').
  endmethod.


method set_lowercase.
    change_setting( iv_value = iv_value iv_setting = 'LOWERCASE').
  endmethod.


method set_lzero.
    change_setting( iv_value = iv_value iv_setting = 'LZERO').
  endmethod.


method set_mac.
    change_setting( iv_value = iv_value iv_setting = 'MAC').
  endmethod.


method set_mark.
    change_setting( iv_value = iv_value iv_setting = 'MARK').
  endmethod.


method set_no_convext.
    change_setting( iv_value = iv_value iv_setting = 'NO_CONVEXT').
  endmethod.


method set_no_init_ch.
    change_setting( iv_value = iv_value iv_setting = 'NO_INIT_CH').
  endmethod.


method set_no_merging.
    change_setting( iv_value = iv_value iv_setting = 'NO_MERGING').
  endmethod.


method set_no_out.
    change_setting( iv_value = iv_value iv_setting = 'NO_OUT').
  endmethod.


method set_no_sign.
    change_setting( iv_value = iv_value iv_setting = 'NO_SIGN').
  endmethod.


method set_no_sum.
    change_setting( iv_value = iv_value iv_setting = 'NO_SUM').
  endmethod.


method set_no_zero.
    change_setting( iv_value = iv_value iv_setting = 'NO_ZERO').
  endmethod.


method set_outputlen.
    change_setting( iv_value = iv_value iv_setting = 'OUTPUTLEN').
  endmethod.


method set_parameter0.
    change_setting( iv_value = iv_value iv_setting = 'PARAMETER0').
  endmethod.


method set_parameter1.
    change_setting( iv_value = iv_value iv_setting = 'PARAMETER1').
  endmethod.


method set_parameter2.
    change_setting( iv_value = iv_value iv_setting = 'PARAMETER2').
  endmethod.


method set_parameter3.
    change_setting( iv_value = iv_value iv_setting = 'PARAMETER3').
  endmethod.


method set_parameter4.
    change_setting( iv_value = iv_value iv_setting = 'PARAMETER4').
  endmethod.


method set_parameter5.
    change_setting( iv_value = iv_value iv_setting = 'PARAMETER5').
  endmethod.


method set_parameter6.
    change_setting( iv_value = iv_value iv_setting = 'PARAMETER6').
  endmethod.


method set_parameter7.
    change_setting( iv_value = iv_value iv_setting = 'PARAMETER7').
  endmethod.


method set_parameter8.
    change_setting( iv_value = iv_value iv_setting = 'PARAMETER8').
  endmethod.


method set_parameter9.
    change_setting( iv_value = iv_value iv_setting = 'PARAMETER9').
  endmethod.


method set_qfieldname.
    change_setting( iv_value = iv_value iv_setting = 'QFIELDNAME').
  endmethod.


method set_quantity.
    change_setting( iv_value = iv_value iv_setting = 'QUANTITY').
  endmethod.


method set_readonly.
    change_setting( iv_value = abap_false iv_setting = 'EDIT').
  endmethod.


method set_ref_field.
    change_setting( iv_value = iv_value iv_setting = 'REF_FIELD').
  endmethod.


method set_ref_table.
    change_setting( iv_value = iv_value iv_setting = 'REF_TABLE').
  endmethod.


method set_reprep.
    change_setting( iv_value = iv_value iv_setting = 'REPREP').
  endmethod.


method set_reptext.
    change_setting( iv_value = iv_value iv_setting = 'REPTEXT').
  endmethod.


method set_rollname.
    change_setting( iv_value = iv_value iv_setting = 'ROLLNAME').
  endmethod.


method set_round.
    change_setting( iv_value = iv_value iv_setting = 'ROUND').
  endmethod.


method set_roundfield.
    change_setting( iv_value = iv_value iv_setting = 'ROUNDFIELD').
  endmethod.


method set_row_pos.
    change_setting( iv_value = iv_value iv_setting = 'ROW_POS').
  endmethod.


method set_scrtext_l.
    change_setting( iv_value = iv_value iv_setting = 'SCRTEXT_L').
  endmethod.


method set_scrtext_m.
    change_setting( iv_value = iv_value iv_setting = 'SCRTEXT_M').
  endmethod.


method set_scrtext_s.
    change_setting( iv_value = iv_value iv_setting = 'SCRTEXT_S').
  endmethod.


method set_selddictxt.
    change_setting( iv_value = iv_value iv_setting = 'SELDDICTXT').
  endmethod.


method set_seltext.
    change_setting( iv_value = iv_value iv_setting = 'SELTEXT').
  endmethod.


method set_sp_group.
    change_setting( iv_value = iv_value iv_setting = 'SP_GROUP').
  endmethod.


method set_style.
    change_setting( iv_value = iv_value iv_setting = 'STYLE').
  endmethod.


method set_style2.
    change_setting( iv_value = iv_value iv_setting = 'STYLE2').
  endmethod.


method set_style3.
    change_setting( iv_value = iv_value iv_setting = 'STYLE3').
  endmethod.


method set_style4.
    change_setting( iv_value = iv_value iv_setting = 'STYLE4').
  endmethod.


method set_symbol.
    change_setting( iv_value = iv_value iv_setting = 'SYMBOL').
  endmethod.


method set_tabname.
    change_setting( iv_value = iv_value iv_setting = 'TABNAME').
  endmethod.


method set_tech.
    change_setting( iv_value = iv_value iv_setting = 'TECH').
  endmethod.


method set_tech_col.
    change_setting( iv_value = iv_value iv_setting = 'TECH_COL').
  endmethod.


method set_tech_comp.
    change_setting( iv_value = iv_value iv_setting = 'TECH_COMP').
  endmethod.


method set_tech_form.
    change_setting( iv_value = iv_value iv_setting = 'TECH_FORM').
  endmethod.


method set_tipddictxt.
    change_setting( iv_value = iv_value iv_setting = 'TIPDDICTXT').
  endmethod.


method set_tooltip.
    change_setting( iv_value = iv_value iv_setting = 'TOOLTIP').
  endmethod.


method set_txt_field.
    change_setting( iv_value = iv_value iv_setting = 'TXT_FIELD').
  endmethod.


method set_valexi.
    change_setting( iv_value = iv_value iv_setting = 'VALEXI').
  endmethod.


method set_web_field.
    change_setting( iv_value = iv_value iv_setting = 'WEB_FIELD').
  endmethod.
ENDCLASS.
