class ZCL_FALV_LAYOUT definition
  public
  create public

  global friends ZCL_FALV .

public section.
*"* public components of class ZCL_FALV_LAYOUT
*"* do not include other source files here!!!

  data MARK_FIELD type LVC_FNAME read-only .

  methods CONSTRUCTOR
    importing
      !IO_FALV type ref to ZCL_FALV .
  methods SET_ZEBRA
    importing
      value(IV_VALUE) type LVC_ZEBRA .
  methods SET_EDIT
    importing
      value(IV_VALUE) type LVC_EDIT .
  methods SET_EDIT_MODE
    importing
      value(IV_VALUE) type LVC_EDMO .
  methods SET_NO_KEYFIX
    importing
      value(IV_VALUE) type LVC_NOKFIX .
  methods SET_FRONTEND
    importing
      value(IV_VALUE) type LVC_FRONT .
  methods SET_OBJECT_KEY
    importing
      value(IV_VALUE) type BDS_TYPEID .
  methods SET_DOC_ID
    importing
      value(IV_VALUE) type BDS_DOCID .
  methods SET_TEMPLATE
    importing
      value(IV_VALUE) type BDS_FILENA .
  methods SET_LANGUAGE
    importing
      value(IV_VALUE) type LANG .
  methods SET_GRAPHICS
    importing
      value(IV_VALUE) type GUID_32 .
  methods SET_SMALLTITLE
    importing
      value(IV_VALUE) type LVC_TITSZ .
  methods SET_NO_HGRIDLN
    importing
      value(IV_VALUE) type LVC_HGRID .
  methods SET_NO_VGRIDLN
    importing
      value(IV_VALUE) type LVC_VGRID .
  methods SET_NO_HEADERS
    importing
      value(IV_VALUE) type LVC_HEADS .
  methods SET_NO_MERGING
    importing
      value(IV_VALUE) type LVC_MERGE .
  methods SET_CWIDTH_OPT
    importing
      value(IV_VALUE) type LVC_CWO .
  methods SET_TOTALS_BEF
    importing
      value(IV_VALUE) type LVC_TOTBEF .
  methods SET_NO_TOTARR
    importing
      value(IV_VALUE) type CHAR01 .
  methods SET_NO_TOTEXP
    importing
      value(IV_VALUE) type CHAR01 .
  methods SET_NO_ROWMOVE
    importing
      value(IV_VALUE) type CHAR01 .
  methods SET_NO_ROWINS
    importing
      value(IV_VALUE) type CHAR01 .
  methods SET_NO_COLEXPD
    importing
      value(IV_VALUE) type CHAR01 .
  methods SET_NO_F4
    importing
      value(IV_VALUE) type CHAR01 .
  methods SET_COUNTFNAME
    importing
      value(IV_VALUE) type LVC_FNAME .
  methods SET_COL_OPT
    importing
      value(IV_VALUE) type CHAR01 .
  methods SET_VAL_DATA
    importing
      value(IV_VALUE) type CHAR01 .
  methods SET_BLOB_SCOPE
    importing
      value(IV_VALUE) type SALV_BS_BLOB_SCOPE .
  methods SET_BLOB_FLAVOUR
    importing
      value(IV_VALUE) type SALV_BS_BLOB_FLAVOUR .
  methods SET_BLOB_NAME
    importing
      value(IV_VALUE) type SALV_BS_BLOB_NAME .
  methods SET_BLOB_KEY
    importing
      value(IV_VALUE) type SLIS_BLOB_KEY .
  methods SET_BLOB_TYPE
    importing
      value(IV_VALUE) type SLIS_BLOB_TYPE .
  methods SET_STYLEFNAME
    importing
      value(IV_VALUE) type LVC_FNAME .
  methods SET_NO_ROWMARK
    importing
      value(IV_VALUE) type LVC_ROWMK .
  methods SET_NO_TOOLBAR
    importing
      value(IV_VALUE) type LVC_TOOLB .
  methods SET_GRID_TITLE
    importing
      value(IV_VALUE) type LVC_TITLE .
  methods SET_SEL_MODE
    importing
      value(IV_VALUE) type LVC_LIBOX .
  methods SET_BOX_FNAME
    importing
      value(IV_VALUE) type LVC_FNAME .
  methods SET_SGL_CLK_HD
    importing
      value(IV_VALUE) type LVC_SGLCLH .
  methods SET_NO_TOTLINE
    importing
      value(IV_VALUE) type LVC_NOTOTL .
  methods SET_NUMC_TOTAL
    importing
      value(IV_VALUE) type LVC_NUMCTO .
  methods SET_NO_UTSPLIT
    importing
      value(IV_VALUE) type LVC_UNITSP .
  methods SET_EXCP_FNAME
    importing
      value(IV_VALUE) type LVC_EXFNM .
  methods SET_EXCP_ROLLN
    importing
      value(IV_VALUE) type LVC_EXROL .
  methods SET_EXCP_CONDS
    importing
      value(IV_VALUE) type LVC_EXCON .
  methods SET_EXCP_LED
    importing
      value(IV_VALUE) type LVC_EXLED .
  methods SET_EXCP_GROUP
    importing
      value(IV_VALUE) type LVC_EXGRP .
  methods SET_DETAILINIT
    importing
      value(IV_VALUE) type LVC_DETINI .
  methods SET_DETAILTITL
    importing
      value(IV_VALUE) type LVC_DETTIT .
  methods SET_KEYHOT
    importing
      value(IV_VALUE) type LVC_KEYHOT .
  methods SET_NO_AUTHOR
    importing
      value(IV_VALUE) type LVC_NOAUTH .
  methods SET_XIFUNCKEY
    importing
      value(IV_VALUE) type AQS_XIKEY .
  methods SET_XIDIRECT
    importing
      value(IV_VALUE) type FLAG .
  methods SET_S_DRAGDROP
    importing
      value(IV_VALUE) type LVC_S_DD01 .
  methods SET_INFO_FNAME
    importing
      value(IV_VALUE) type LVC_CIFNM .
  methods SET_CTAB_FNAME
    importing
      value(IV_VALUE) type LVC_CTFNM .
  methods SET_WEBLOOK
    importing
      value(IV_VALUE) type LVC_LOOK .
  methods SET_WEBSTYLE
    importing
      value(IV_VALUE) type LVC_STYLE .
  methods SET_WEBROWS
    importing
      value(IV_VALUE) type LVC_WEBROW .
  methods SET_WEBXWIDTH
    importing
      value(IV_VALUE) type INT4 .
  methods SET_WEBXHEIGHT
    importing
      value(IV_VALUE) type INT4 .
protected section.
*"* protected components of class ZCL_FALV_LAYOUT
*"* do not include other source files here!!!
private section.
*"* private components of class ZCL_FALV_LAYOUT
*"* do not include other source files here!!!

  data FALV type ref to ZCL_FALV .

  methods CHANGE_SETTING
    importing
      value(IV_VALUE) type ANY
      value(IV_SETTING) type STRING .
ENDCLASS.



CLASS ZCL_FALV_LAYOUT IMPLEMENTATION.


method change_setting.
    falv->get_frontend_layout(  importing  es_layout = falv->lvc_layout ).
*Begin SMD
*    data(layout_field) = |falv->lvc_layout-{ iv_setting }|.
*    assign (layout_field) to field-symbol(<field>).
    DATA: layout_field TYPE string.
    FIELD-SYMBOLS: <field> TYPE any.
    layout_field = |falv->lvc_layout-{ iv_setting }|.
    assign (layout_field) to <field>.
*End SMD
    if sy-subrc eq 0.
      <field> = iv_value.
    endif.
    falv->set_frontend_layout( is_layout = falv->lvc_layout  ).
  endmethod.


method constructor.
    falv = io_falv.
  endmethod.


method set_blob_flavour.  change_setting( iv_value = iv_value iv_setting = 'BLOB_FLAVOUR'). endmethod.


method set_blob_key.  change_setting( iv_value = iv_value iv_setting = 'BLOB_KEY'). endmethod.


method set_blob_name.  change_setting( iv_value = iv_value iv_setting = 'BLOB_NAME'). endmethod.


method set_blob_scope.  change_setting( iv_value = iv_value iv_setting = 'BLOB_SCOPE'). endmethod.


method set_blob_type.  change_setting( iv_value = iv_value iv_setting = 'BLOB_TYPE'). endmethod.


method set_box_fname.  change_setting( iv_value = iv_value iv_setting = 'BOX_FNAME'). endmethod.


method set_col_opt.  change_setting( iv_value = iv_value iv_setting = 'COL_OPT'). endmethod.


method set_countfname.  change_setting( iv_value = iv_value iv_setting = 'COUNTFNAME'). endmethod.


method set_ctab_fname.  change_setting( iv_value = iv_value iv_setting = 'CTAB_FNAME'). endmethod.


method set_cwidth_opt.  change_setting( iv_value = iv_value iv_setting = 'CWIDTH_OPT'). endmethod.


method set_detailinit.  change_setting( iv_value = iv_value iv_setting = 'DETAILINIT'). endmethod.


method set_detailtitl.  change_setting( iv_value = iv_value iv_setting = 'DETAILTITL'). endmethod.


method set_doc_id.  change_setting( iv_value = iv_value iv_setting = 'DOC_ID'). endmethod.


method set_edit.  change_setting( iv_value = iv_value iv_setting = 'EDIT'). endmethod.


method set_edit_mode.  change_setting( iv_value = iv_value iv_setting = 'EDIT_MODE'). endmethod.


method set_excp_conds.  change_setting( iv_value = iv_value iv_setting = 'EXCP_CONDS'). endmethod.


method set_excp_fname.  change_setting( iv_value = iv_value iv_setting = 'EXCP_FNAME'). endmethod.


method set_excp_group.  change_setting( iv_value = iv_value iv_setting = 'EXCP_GROUP'). endmethod.


method set_excp_led.  change_setting( iv_value = iv_value iv_setting = 'EXCP_LED'). endmethod.


method set_excp_rolln.  change_setting( iv_value = iv_value iv_setting = 'EXCP_ROLLN'). endmethod.


method set_frontend.  change_setting( iv_value = iv_value iv_setting = 'FRONTEND'). endmethod.


method set_graphics.  change_setting( iv_value = iv_value iv_setting = 'GRAPHICS'). endmethod.


method set_grid_title.  change_setting( iv_value = iv_value iv_setting = 'GRID_TITLE'). endmethod.


method set_info_fname.  change_setting( iv_value = iv_value iv_setting = 'INFO_FNAME'). endmethod.


method set_keyhot.  change_setting( iv_value = iv_value iv_setting = 'KEYHOT'). endmethod.


method set_language.  change_setting( iv_value = iv_value iv_setting = 'LANGUAGE'). endmethod.


method set_no_author.  change_setting( iv_value = iv_value iv_setting = 'NO_AUTHOR'). endmethod.


method set_no_colexpd.  change_setting( iv_value = iv_value iv_setting = 'NO_COLEXPD'). endmethod.


method set_no_f4.  change_setting( iv_value = iv_value iv_setting = 'NO_F4'). endmethod.


method set_no_headers.  change_setting( iv_value = iv_value iv_setting = 'NO_HEADERS'). endmethod.


method set_no_hgridln.  change_setting( iv_value = iv_value iv_setting = 'NO_HGRIDLN'). endmethod.


method set_no_keyfix.  change_setting( iv_value = iv_value iv_setting = 'NO_KEYFIX'). endmethod.


method set_no_merging.  change_setting( iv_value = iv_value iv_setting = 'NO_MERGING'). endmethod.


method set_no_rowins.  change_setting( iv_value = iv_value iv_setting = 'NO_ROWINS'). endmethod.


method set_no_rowmark.  change_setting( iv_value = iv_value iv_setting = 'NO_ROWMARK'). endmethod.


method set_no_rowmove.  change_setting( iv_value = iv_value iv_setting = 'NO_ROWMOVE'). endmethod.


method set_no_toolbar.  change_setting( iv_value = iv_value iv_setting = 'NO_TOOLBAR'). endmethod.


method set_no_totarr.  change_setting( iv_value = iv_value iv_setting = 'NO_TOTARR'). endmethod.


method set_no_totexp.  change_setting( iv_value = iv_value iv_setting = 'NO_TOTEXP'). endmethod.


method set_no_totline.  change_setting( iv_value = iv_value iv_setting = 'NO_TOTLINE'). endmethod.


method set_no_utsplit.  change_setting( iv_value = iv_value iv_setting = 'NO_UTSPLIT'). endmethod.


method set_no_vgridln.  change_setting( iv_value = iv_value iv_setting = 'NO_VGRIDLN'). endmethod.


method set_numc_total.  change_setting( iv_value = iv_value iv_setting = 'NUMC_TOTAL'). endmethod.


method set_object_key.  change_setting( iv_value = iv_value iv_setting = 'OBJECT_KEY'). endmethod.


method set_sel_mode.  change_setting( iv_value = iv_value iv_setting = 'SEL_MODE'). endmethod.


method set_sgl_clk_hd.  change_setting( iv_value = iv_value iv_setting = 'SGL_CLK_HD'). endmethod.


method set_smalltitle.  change_setting( iv_value = iv_value iv_setting = 'SMALLTITLE'). endmethod.


method set_stylefname.  change_setting( iv_value = iv_value iv_setting = 'STYLEFNAME'). endmethod.


method set_s_dragdrop.  change_setting( iv_value = iv_value iv_setting = 'S_DRAGDROP'). endmethod.


method set_template.  change_setting( iv_value = iv_value iv_setting = 'TEMPLATE'). endmethod.


method set_totals_bef.  change_setting( iv_value = iv_value iv_setting = 'TOTALS_BEF'). endmethod.


method set_val_data.  change_setting( iv_value = iv_value iv_setting = 'VAL_DATA'). endmethod.


method set_weblook.  change_setting( iv_value = iv_value iv_setting = 'WEBLOOK'). endmethod.


method set_webrows.  change_setting( iv_value = iv_value iv_setting = 'WEBROWS'). endmethod.


method set_webstyle.  change_setting( iv_value = iv_value iv_setting = 'WEBSTYLE'). endmethod.


method set_webxheight.  change_setting( iv_value = iv_value iv_setting = 'WEBXHEIGHT'). endmethod.


method set_webxwidth.  change_setting( iv_value = iv_value iv_setting = 'WEBXWIDTH'). endmethod.


method set_xidirect.  change_setting( iv_value = iv_value iv_setting = 'XIDIRECT'). endmethod.


method set_xifunckey.  change_setting( iv_value = iv_value iv_setting = 'XIFUNCKEY'). endmethod.


method set_zebra.  change_setting( iv_value = iv_value iv_setting = 'ZEBRA'). endmethod.
ENDCLASS.
