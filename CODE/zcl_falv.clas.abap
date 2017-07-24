class ZCL_FALV definition
  public
  inheriting from CL_GUI_ALV_GRID
  create private

  global friends ZCL_FALV_LAYOUT .

public section.
*"* public components of class ZCL_FALV
*"* do not include other source files here!!!

  interfaces IF_OS_CLONE .

  constants CC_NAME type CHAR30 value 'CC_GRID'. "#EC NOTEXT
  constants C_SCREEN_POPUP type SY-DYNNR value '0200'. "#EC NOTEXT
  constants C_SCREEN_FULL type SY-DYNNR value '0100'. "#EC NOTEXT
  constants C_FSCR_REPID type SY-REPID value 'SAPLZFALV'. "#EC NOTEXT
  data RESULT type I read-only .
  data HEIGHT type I read-only .
  constants FC_BACK type SY-UCOMM value 'BACK'. "#EC NOTEXT
  constants FC_UP type SY-UCOMM value 'UP'. "#EC NOTEXT
  constants FC_EXIT type SY-UCOMM value 'EXIT'. "#EC NOTEXT
  constants FC_CANCEL type SY-UCOMM value 'CANCEL'. "#EC NOTEXT
  constants FC_MASS_REPLACE type SY-UCOMM value 'MASS_REPL'. "#EC NOTEXT
  constants FC_SAVE type SY-UCOMM value '&DATA_SAVE'. "#EC NOTEXT
  constants FC_PRINT type SY-UCOMM value 'PRINT'. "#EC NOTEXT
  constants FC_FIND type SY-UCOMM value 'FIND'. "#EC NOTEXT
  constants FC_FIND_NEXT type SY-UCOMM value 'FINDNEXT'. "#EC NOTEXT
  constants FC_FIRST_PAGE type SY-UCOMM value 'PGHOME'. "#EC NOTEXT
  constants FC_LAST_PAGE type SY-UCOMM value 'PGEND'. "#EC NOTEXT
  constants FC_PREVIOUS_PAGE type SY-UCOMM value 'PGUP'. "#EC NOTEXT
  constants FC_NEXT_PAGE type SY-UCOMM value 'PGDOWN'. "#EC NOTEXT
  constants BUTTON_NORMAL type TB_BTYPE value '0'. "#EC NOTEXT
  constants BUTTON_MENU_DEFAULT type TB_BTYPE value '1'. "#EC NOTEXT
  constants BUTTON_MENU type TB_BTYPE value '2'. "#EC NOTEXT
  constants BUTTON_SEPARATOR type TB_BTYPE value '3'. "#EC NOTEXT
  constants BUTTON_RADIOBUTTON type TB_BTYPE value '4'. "#EC NOTEXT
  constants BUTTON_CHECKBOX type TB_BTYPE value '5'. "#EC NOTEXT
  constants BUTTON_MENU_ENTRY type TB_BTYPE value '6'. "#EC NOTEXT
  data MAIN_CONTAINER type ref to CL_GUI_CONTAINER read-only .
  data SPLIT_CONTAINER type ref to CL_GUI_SPLITTER_CONTAINER .
  data VARIANT type DISVARIANT .
  data LAYOUT_SAVE type CHAR01 .
  data EXCLUDE_FUNCTIONS type UI_FUNCTIONS .
  data FCAT type LVC_T_FCAT .
  data SORT type LVC_T_SORT .
  data FILTER type LVC_T_FILT .
  data LVC_LAYOUT type LVC_S_LAYO read-only .
  data LAYOUT type ref to ZCL_FALV_LAYOUT .
  data GUI_STATUS type ref to ZCL_FALV_DYNAMIC_STATUS .
  data SCREEN type SY-DYNNR read-only .
  data OUTTAB type ref to DATA .
  data TITLE_V1 type STRING .
  data TITLE_V2 type STRING .
  data TITLE_V3 type STRING .
  data TITLE_V4 type STRING .
  data TITLE_V5 type STRING .
  data DELAY_MOVE_CURRENT_CELL type I read-only value 20. "#EC NOTEXT .
  data DELAY_CHANGE_SELECTION type I read-only value 20. "#EC NOTEXT .

  type-pools ABAP .
  class-methods CREATE
    importing
      value(I_PARENT) type ref to CL_GUI_CONTAINER optional
      value(I_APPLOGPARENT) type ref to CL_GUI_CONTAINER optional
      value(I_POPUP) type ABAP_BOOL default ABAP_FALSE
      value(I_APPLOG_EMBEDDED) type ABAP_BOOL default ABAP_FALSE
      value(I_SUBCLASS) type ref to CL_ABAP_TYPEDESCR optional
    changing
      !CT_TABLE type STANDARD TABLE
      !RV_FALV type ref to ZCL_FALV .
  methods CREATE_BY_COPY
    importing
      value(I_PARENT) type ref to CL_GUI_CONTAINER optional
      value(I_APPLOGPARENT) type ref to CL_GUI_CONTAINER optional
      value(I_POPUP) type ABAP_BOOL default ABAP_FALSE
    returning
      value(RV_FALV) type ref to ZCL_FALV .
  class-methods LVC_FCAT_FROM_ITAB
    importing
      !IT_TABLE type STANDARD TABLE
    returning
      value(RT_FCAT) type LVC_T_FCAT .
  methods PBO
    importing
      value(IV_DYNNR) type SY-DYNNR default SY-DYNNR .
  methods PAI
    importing
      value(IV_DYNNR) type SY-DYNNR default SY-DYNNR
    changing
      !C_UCOMM type SY-UCOMM default SY-UCOMM .
  methods DISPLAY
    importing
      value(IV_FORCE_GRID) type ABAP_BOOL default SPACE
      value(IV_START_ROW) type I optional
      value(IV_START_COLUMN) type I optional
      value(IV_END_ROW) type I optional
      value(IV_END_COLUMN) type I optional .
  methods EXCLUDE_FUNCTION
    importing
      value(IV_UCOMM) type SY-UCOMM .
  methods COLUMN
    importing
      value(IV_FIELDNAME) type LVC_S_FCAT-FIELDNAME
    returning
      value(RV_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods SOFT_REFRESH .
  methods SET_MARK_FIELD
    importing
      value(IV_FIELDNAME) type LVC_S_FCAT-FIELDNAME .
  methods SET_EDITABLE
    importing
      value(IV_MODIFY) type ABAP_BOOL default ABAP_FALSE .
  methods SET_READONLY .
  methods ADD_BUTTON
    importing
      value(IV_FUNCTION) type UI_FUNC
      value(IV_ICON) type ICON_D optional
      value(IV_QUICKINFO) type ICONQUICK optional
      value(IV_BUTN_TYPE) type TB_BTYPE optional
      value(IV_DISABLED) type ABAP_BOOL optional
      value(IV_TEXT) type TEXT40 optional
      value(IV_CHECKED) type ABAP_BOOL optional .
  methods DISABLE_BUTTON
    importing
      value(IV_FUNCTION) type UI_FUNC .
  methods ENABLE_BUTTON
    importing
      value(IV_FUNCTION) type UI_FUNC .
  methods DELETE_BUTTON
    importing
      value(IV_FUNCTION) type UI_FUNC .
  methods SET_CELL_DISABLED
    importing
      value(IV_FIELDNAME) type FIELDNAME
      value(IV_ROW) type LVC_S_ROID-ROW_ID .
  methods SET_CELL_ENABLED
    importing
      value(IV_FIELDNAME) type FIELDNAME
      value(IV_ROW) type LVC_S_ROID-ROW_ID .
  methods SET_CELL_BUTTON
    importing
      value(IV_FIELDNAME) type FIELDNAME
      value(IV_ROW) type LVC_S_ROID-ROW_ID .
  methods SET_CELL_HOTSPOT
    importing
      value(IV_FIELDNAME) type FIELDNAME
      value(IV_ROW) type LVC_S_ROID-ROW_ID .
  methods SET_ROW_COLOR
    importing
      value(IV_COLOR) type CHAR04
      value(IV_ROW) type LVC_S_ROID-ROW_ID .
  methods SET_CELL_COLOR
    importing
      value(IV_FIELDNAME) type FIELDNAME
      value(IV_COLOR) type LVC_S_COLO
      value(IV_ROW) type LVC_S_ROID-ROW_ID .
  methods MASS_REPLACE .

  methods SET_FRONTEND_FIELDCATALOG
    redefinition .
  methods SET_FRONTEND_LAYOUT
    redefinition .
protected section.
*"* protected components of class ZCL_FALV
*"* do not include other source files here!!!

  types T_COLUMN type ref to ZCL_FALV_COLUMN .

  data TOOLBAR_ADDED type TTB_BUTTON .
  data TOOLBAR_DELETED type TTB_BUTTON .
  data TOOLBAR_DISABLED type TTB_BUTTON .
  data:
    columns TYPE SORTED TABLE OF t_column WITH UNIQUE KEY table_line .
  data BUILT_IN_SCREEN type ABAP_BOOL .
  data APPLICATION_LOG_EMBEDDED type ABAP_BOOL .
  data SUBCLASS_TYPE type ref to CL_ABAP_TYPEDESCR .

  events AT_SET_PF_STATUS .
  events AT_SET_TITLE .

  methods EVF_BUTTON_CLICK_FALV
    for event BUTTON_CLICK of CL_GUI_ALV_GRID
    importing
      !ES_COL_ID
      !ES_ROW_NO .
  methods EVF_USER_COMMAND
    for event USER_COMMAND of CL_GUI_ALV_GRID
    importing
      !E_UCOMM .
  methods EVF_HOTSPOT_CLICK
    for event HOTSPOT_CLICK of CL_GUI_ALV_GRID
    importing
      !E_ROW_ID
      !E_COLUMN_ID
      !ES_ROW_NO .
  methods EVF_DATA_CHANGED
    for event DATA_CHANGED of CL_GUI_ALV_GRID
    importing
      !ER_DATA_CHANGED
      !E_ONF4
      !E_ONF4_BEFORE
      !E_ONF4_AFTER
      !E_UCOMM .
  methods EVF_DATA_CHANGED_FINISHED
    for event DATA_CHANGED_FINISHED of CL_GUI_ALV_GRID
    importing
      !E_MODIFIED
      !ET_GOOD_CELLS .
  methods EVF_DOUBLE_CLICK
    for event DOUBLE_CLICK of CL_GUI_ALV_GRID
    importing
      !E_ROW
      !E_COLUMN
      !ES_ROW_NO .
  methods EVF_ONF1
    for event ONF1 of CL_GUI_ALV_GRID
    importing
      !E_FIELDNAME
      !ES_ROW_NO
      !ER_EVENT_DATA .
  methods EVF_ONF4
    for event ONF4 of CL_GUI_ALV_GRID
    importing
      !E_FIELDNAME
      !E_FIELDVALUE
      !ES_ROW_NO
      !ER_EVENT_DATA
      !ET_BAD_CELLS
      !E_DISPLAY .
  methods EVF_SUBTOTAL_TEXT
    for event SUBTOTAL_TEXT of CL_GUI_ALV_GRID
    importing
      !ES_SUBTOTTXT_INFO
      !EP_SUBTOT_LINE
      !E_EVENT_DATA .
  methods EVF_BEFORE_USER_COMMAND
    for event BEFORE_USER_COMMAND of CL_GUI_ALV_GRID
    importing
      !E_UCOMM .
  methods EVF_AFTER_USER_COMMAND
    for event AFTER_USER_COMMAND of CL_GUI_ALV_GRID
    importing
      !E_UCOMM
      !E_SAVED
      !E_NOT_PROCESSED .
  methods EVF_MENU_BUTTON
    for event MENU_BUTTON of CL_GUI_ALV_GRID
    importing
      !E_OBJECT
      !E_UCOMM .
  methods EVF_TOOLBAR
    for event TOOLBAR of CL_GUI_ALV_GRID
    importing
      !E_OBJECT
      !E_INTERACTIVE .
  methods EVF_AFTER_REFRESH
    for event AFTER_REFRESH of CL_GUI_ALV_GRID .
  methods EVF_AT_SET_PF_STATUS
    for event AT_SET_PF_STATUS of ZCL_FALV .
  methods EVF_AT_SET_TITLE
    for event AT_SET_TITLE of ZCL_FALV .
  methods EVF_TOP_OF_PAGE
    for event TOP_OF_PAGE of CL_GUI_ALV_GRID
    importing
      !E_DYNDOC_ID
      !TABLE_INDEX .
  methods EVF_DELAYED_CALLBACK
    for event DELAYED_CALLBACK of CL_GUI_ALV_GRID .
  methods EVF_DELAYED_CHANGED_SEL_CALL
    for event DELAYED_CHANGED_SEL_CALLBACK of CL_GUI_ALV_GRID .
  methods EVF_ONDROPGETFLAVOR
    for event ONDROPGETFLAVOR of CL_GUI_ALV_GRID
    importing
      !ES_ROW_NO
      !E_COLUMN
      !E_DRAGDROPOBJ
      !E_FLAVORS
      !E_ROW .
  methods EVF_ONDRAG
    for event ONDRAG of CL_GUI_ALV_GRID
    importing
      !ES_ROW_NO
      !E_COLUMN
      !E_DRAGDROPOBJ
      !E_ROW .
  methods EVF_ONDROP
    for event ONDROP of CL_GUI_ALV_GRID
    importing
      !ES_ROW_NO
      !E_COLUMN
      !E_DRAGDROPOBJ
      !E_ROW .
  methods EVF_ONDROPCOMPLETE
    for event ONDROPCOMPLETE of CL_GUI_ALV_GRID
    importing
      !ES_ROW_NO
      !E_COLUMN
      !E_DRAGDROPOBJ
      !E_ROW .
  methods EVF_DROP_EXTERNAL_FILE
    for event DROP_EXTERNAL_FILES of CL_GUI_ALV_GRID
    importing
      !FILES .
  methods EVF_TOOLBAR_MENUBUTTON_CLICK
    for event TOOLBAR_MENUBUTTON_CLICK of CL_GUI_ALV_GRID
    importing
      !FCODE
      !MENU_POS_X
      !MENU_POS_Y .
  methods EVF_CLICK_COL_HEADER
    for event CLICK_COL_HEADER of CL_GUI_ALV_GRID
    importing
      !COL_ID .
  methods EVF_DELAYED_MOVE_CURRENT_CELL
    for event DELAYED_MOVE_CURRENT_CELL of CL_GUI_ALV_GRID .
  methods EVF_F1
    for event F1 of CL_GUI_ALV_GRID .
  methods EVF_DBLCLICK_ROW_COL
    for event DBLCLICK_ROW_COL of CL_GUI_ALV_GRID
    importing
      !COL_ID
      !ROW_ID .
  methods EVF_CLICK_ROW_COL
    for event CLICK_ROW_COL of CL_GUI_ALV_GRID
    importing
      !COL_ID
      !ROW_ID .
  methods EVF_TOOLBAR_BUTTON_CLICK
    for event TOOLBAR_BUTTON_CLICK of CL_GUI_ALV_GRID
    importing
      !FCODE .
  methods EVF_DOUBLE_CLICK_COL_SEPARATOR
    for event DOUBLE_CLICK_COL_SEPARATOR of CL_GUI_ALV_GRID
    importing
      !COL_ID .
  methods EVF_DELAYED_CHANGE_SELECTION
    for event DELAYED_CHANGE_SELECTION of CL_GUI_ALV_GRID .
  methods EVF_CONTEXT_MENU
    for event CONTEXT_MENU of CL_GUI_ALV_GRID .
  methods EVF_TOTAL_CLICK_ROW_COL
    for event TOTAL_CLICK_ROW_COL of CL_GUI_ALV_GRID
    importing
      !COL_ID
      !ROW_ID .
  methods EVF_CONTEXT_MENU_SELECTED
    for event CONTEXT_MENU_SELECTED of CL_GUI_ALV_GRID
    importing
      !FCODE .
  methods EVF_TOOLBAR_MENU_SELECTED
    for event TOOLBAR_MENU_SELECTED of CL_GUI_ALV_GRID
    importing
      !FCODE .
private section.
*"* private components of class ZCL_FALV
*"* do not include other source files here!!!

  methods REFRESH_TOOLBAR .
  methods EVF_BEFORE_UCOMMAND_INTERNAL
    for event BEFORE_USER_COMMAND of CL_GUI_ALV_GRID
    importing
      !E_UCOMM .
  methods EVF_TOOLBAR_INTERNAL
    for event TOOLBAR of CL_GUI_ALV_GRID
    importing
      !E_OBJECT
      !E_INTERACTIVE .
  methods EVF_DATA_CHANGED_INTERNAL
    for event DATA_CHANGED of CL_GUI_ALV_GRID
    importing
      !ER_DATA_CHANGED
      !E_ONF4
      !E_ONF4_BEFORE
      !E_ONF4_AFTER
      !E_UCOMM .
  methods EVF_USER_COMMAND_INTERNAL
    for event USER_COMMAND of CL_GUI_ALV_GRID
    importing
      !E_UCOMM .
  methods SET_PARENT
    importing
      !IO_PARENT type ref to OBJECT .
  methods HIDE_APPLOG .
  methods CONSTRUCTOR
    importing
      value(I_SHELLSTYLE) type I default 0
      value(I_LIFETIME) type I optional
      value(I_PARENT) type ref to CL_GUI_CONTAINER optional
      value(I_APPL_EVENTS) type CHAR01 default SPACE
      !I_PARENTDBG type ref to CL_GUI_CONTAINER optional
      !I_APPLOGPARENT type ref to CL_GUI_CONTAINER optional
      !I_GRAPHICSPARENT type ref to CL_GUI_CONTAINER optional
      value(I_NAME) type STRING optional
      !I_FCAT_COMPLETE type SAP_BOOL default SPACE
    exceptions
      ERROR_CNTL_CREATE
      ERROR_CNTL_INIT
      ERROR_CNTL_LINK
      ERROR_DP_CREATE .
  methods SET_OUTPUT_TABLE
    changing
      !CT_TABLE type STANDARD TABLE .
  methods BUILD_COLUMNS .
  methods SHOW_APPLOG .
ENDCLASS.



CLASS ZCL_FALV IMPLEMENTATION.


METHOD add_button.
*Begin SMD
*    if not line_exists( toolbar_added[ function = iv_function ] ).
*      insert value #( function = iv_function
*                      icon = conv #( iv_icon )
*                      quickinfo = iv_quickinfo
*                      butn_type = iv_butn_type
*                      disabled = iv_disabled
*                      text = iv_text
*                      checked = iv_checked
*                        ) into table toolbar_added .
    FIELD-SYMBOLS: <toolbar_added> LIKE LINE OF toolbar_added.
    DATA: ls_toolbar_added LIKE LINE OF toolbar_added.
    READ TABLE toolbar_added ASSIGNING <toolbar_added> WITH KEY function = iv_function.
    IF sy-subrc NE 0.
      CLEAR: ls_toolbar_added.
      ls_toolbar_added-function = iv_function.
      ls_toolbar_added-icon = iv_icon.
      ls_toolbar_added-quickinfo = iv_quickinfo.
      ls_toolbar_added-butn_type = iv_butn_type.
      ls_toolbar_added-disabled = iv_disabled.
      ls_toolbar_added-text = iv_text.
      ls_toolbar_added-checked = iv_checked.
      INSERT ls_toolbar_added INTO TABLE toolbar_added.
*End SMD
      DELETE toolbar_deleted WHERE function = iv_function.
      me->refresh_toolbar( ).
    ENDIF.

  ENDMETHOD.                    "add_button


METHOD build_columns.
*Begin SMD
*    loop at fcat assigning field-symbol(<fcat>).
*      data(column) = new zcl_falv_column( iv_fieldname = <fcat>-fieldname io_falv = me ).
    FIELD-SYMBOLS: <fcat> LIKE LINE OF fcat.
    DATA: column TYPE REF TO zcl_falv_column.
    LOOP AT fcat ASSIGNING <fcat>.
      CREATE OBJECT column
        EXPORTING
          iv_fieldname = <fcat>-fieldname
          io_falv      = me.
*End SMD
      INSERT column INTO TABLE columns.
    ENDLOOP.
  ENDMETHOD.                    "build_columns


METHOD column.
*Begin SMD
*  TRY.

*        rv_column = columns[  table_line->fieldname = iv_fieldname ].
*    CATCH cx_sy_itab_line_not_found.

*  ENDTRY.
    READ TABLE columns INTO rv_column WITH KEY table_line->fieldname = iv_fieldname.
*Begin SMD
  ENDMETHOD.                    "column


METHOD constructor.
    super->constructor(
      EXPORTING
        i_shellstyle      = i_shellstyle    " Control Style
        i_lifetime        = i_lifetime    " Lifetime
        i_parent          = i_parent    " Parent Container
        i_appl_events     = i_appl_events    " Register Events as Application Events
        i_parentdbg       = i_parentdbg    " Internal, Do not Use
        i_applogparent    = i_applogparent    " Container for Application Log
        i_graphicsparent  = i_graphicsparent    " Container for Graphics
        i_name            = i_name    " Name
        i_fcat_complete   = i_fcat_complete  " Boolean Variable (X=True, Space=False)
      EXCEPTIONS
        error_cntl_create = 1
        error_cntl_init   = 2
        error_cntl_link   = 3
        error_dp_create   = 4
        OTHERS            = 5
    ).
    IF sy-subrc <> 0.
      CASE sy-subrc.
        WHEN 1.
          RAISE error_cntl_create.
        WHEN 2.
          RAISE error_cntl_init.
        WHEN 3.
          RAISE error_cntl_link.
        WHEN 4.
          RAISE error_dp_create.
      ENDCASE.
    ENDIF.
  ENDMETHOD.                    "constructor


METHOD create.
    DATA: built_in_screen TYPE abap_bool.
    DATA: custom_container TYPE REF TO cl_gui_custom_container.
    DATA: parent TYPE REF TO cl_gui_container.
    DATA: applog TYPE REF TO cl_gui_container.
*Begin SMD En fondo 10/03/2016
    DATA: or_doc  TYPE REF TO cl_gui_docking_container.
*End SMD En fondo 10/03/2016
*Begin SMD
    DATA: lv_dynnr TYPE sydynnr.
    IF i_popup = abap_true.
      lv_dynnr = c_screen_popup.
    ELSE.
      lv_dynnr = c_screen_full.
    ENDIF.
    DATA split_container TYPE REF TO cl_gui_splitter_container.
    DATA splitter_rows type i.
*End SMD

            IF i_applog_embedded EQ abap_true.
              " Create split container, log at bottom, grid at top.
              "Log hidden as default, will appear when error will be thrown.
                splitter_rows = 2.
            ELSE.
                splitter_rows = 1.
            ENDIF.

*Begin SMD En fondo 10/03/2016
    IF cl_gui_alv_grid=>offline( ) IS INITIAL.
*End SMD En fondo 10/03/2016
      "We need to call full screen ALV as container was not passed
      IF i_parent IS INITIAL.

        built_in_screen = abap_true.
        TRY.
            CREATE OBJECT custom_container
              EXPORTING
                container_name          = cc_name
*Begin SMD
*              dynnr                   = switch #( i_popup when abap_true then c_screen_popup
*                                                          when abap_false then c_screen_full )
                dynnr                   = lv_dynnr
*End SMD
                repid                   = c_fscr_repid
                no_autodef_progid_dynnr = abap_true.



              CREATE OBJECT split_container
                EXPORTING
                  link_dynnr = lv_dynnr
                  link_repid = c_fscr_repid
                  parent     = custom_container
                  rows       = splitter_rows
                  columns    = 1.
*End SMD
              parent ?= split_container->get_container( row = 1 column    = 1 ).
              applog = split_container->get_container( row = 2 column    = 1 ).

          CATCH cx_root.
            "Something is wrong...
        ENDTRY.
      ELSE.

        applog ?= i_applogparent.
        IF applog IS INITIAL.
          custom_container ?= i_parent.
*Begin SMD
*      split_container = new cl_gui_splitter_container(
*           parent                  = custom_container
*           ROWS                    = 2
*           COLUMNS                 = 1
*      ).
          CREATE OBJECT split_container
            EXPORTING
              parent  = custom_container
              rows    = splitter_rows
              columns = 1.
*End SMD
          parent ?= split_container->get_container( row = 1 column    = 1 ).
          applog = split_container->get_container( row = 2 column    = 1 ).
        ELSE.
          parent ?= i_parent.
          custom_container ?= i_parent.
        ENDIF.

      ENDIF.
*Begin SMD En fondo 10/03/2016
    ENDIF.
*End SMD En fondo 10/03/2016
    IF i_subclass IS NOT INITIAL.
      DATA: subclass TYPE REF TO object.
*Begin SMD
*    data(sublcass_abs_name) = i_subclass->absolute_name.
      DATA: sublcass_abs_name TYPE abap_abstypename.
      sublcass_abs_name = i_subclass->absolute_name.
*End SMD
*        data(subclass_type) = cl_abap_classdescr=>describe_by_name( p_name = i_subclass ).
*Begin SMD En fondo 10/03/2016
      IF cl_gui_alv_grid=>offline( ) IS INITIAL.
*End SMD En fondo 10/03/2016
        CREATE OBJECT subclass TYPE (sublcass_abs_name)
          EXPORTING
            i_parent       = parent
            i_applogparent = applog.
*Begin SMD En fondo 10/03/2016
      ELSE.
        CREATE OBJECT subclass TYPE (sublcass_abs_name)
          EXPORTING
            i_parent = or_doc.
      ENDIF.
*End SMD En fondo 10/03/2016
      rv_falv ?= subclass.
      rv_falv->subclass_type = i_subclass.
    ELSE.
*Begin SMD En fondo 10/03/2016
      IF cl_gui_alv_grid=>offline( ) IS INITIAL.
*End SMD En fondo 10/03/2016
        CREATE OBJECT rv_falv
          EXPORTING
            i_parent       = parent
            i_applogparent = applog.
*Begin SMD En fondo 10/03/2016
      ELSE.
        CREATE OBJECT rv_falv
          EXPORTING
            i_parent = or_doc.
      ENDIF.
*End SMD En fondo 10/03/2016
    ENDIF.
    SET HANDLER rv_falv->evf_after_refresh FOR rv_falv.
    SET HANDLER rv_falv->evf_after_user_command FOR rv_falv.
    SET HANDLER rv_falv->evf_before_ucommand_internal FOR rv_falv.
    SET HANDLER rv_falv->evf_before_user_command FOR rv_falv.
    SET HANDLER rv_falv->evf_button_click_falv FOR rv_falv.
    SET HANDLER rv_falv->evf_data_changed FOR rv_falv.
    SET HANDLER rv_falv->evf_data_changed_internal FOR rv_falv.
    SET HANDLER rv_falv->evf_data_changed_finished FOR rv_falv.
    SET HANDLER rv_falv->evf_double_click FOR rv_falv.
    SET HANDLER rv_falv->evf_hotspot_click FOR rv_falv.
    SET HANDLER rv_falv->evf_menu_button FOR rv_falv.
    SET HANDLER rv_falv->evf_onf1 FOR rv_falv.
    SET HANDLER rv_falv->evf_onf4 FOR rv_falv.
    SET HANDLER rv_falv->evf_subtotal_text FOR rv_falv.
    SET HANDLER rv_falv->evf_toolbar_internal FOR rv_falv.
    SET HANDLER rv_falv->evf_toolbar FOR rv_falv.
    SET HANDLER rv_falv->evf_user_command FOR rv_falv.
    SET HANDLER rv_falv->evf_user_command_internal FOR rv_falv.
    SET HANDLER rv_falv->evf_at_set_pf_status FOR rv_falv.
    SET HANDLER rv_falv->evf_at_set_title FOR rv_falv.
    set handler rv_falv->evf_top_of_page for rv_falv.
    set handler rv_falv->evf_delayed_callback for rv_falv.
    set handler rv_falv->evf_delayed_changed_sel_call for rv_falv.
    set handler rv_falv->evf_ondrag for rv_falv.
    set handler rv_falv->evf_ondrop for rv_falv.
    set handler rv_falv->evf_ondropcomplete for rv_falv.
    set handler rv_falv->evf_ondropgetflavor for rv_falv.
    set handler rv_falv->evf_drop_external_file for rv_falv.
    set handler rv_falv->evf_toolbar_menubutton_click for rv_falv.
    set handler rv_falv->evf_click_col_header for rv_falv.
    set handler rv_falv->evf_delayed_move_current_cell for rv_falv.
    set handler rv_falv->evf_f1 for rv_falv.
    set handler rv_falv->evf_dblclick_row_col for rv_falv.
    set handler rv_falv->evf_click_row_col for rv_falv.
    set handler rv_falv->evf_toolbar_button_click for rv_falv.
    set handler rv_falv->evf_double_click_col_separator for rv_falv.
    set handler rv_falv->evf_delayed_change_selection for rv_falv.
    set handler rv_falv->evf_context_menu for rv_falv.
    set handler rv_falv->evf_total_click_row_col for rv_falv.
    set handler rv_falv->evf_context_menu_selected for rv_falv.
    set handler rv_falv->evf_toolbar_menu_selected for rv_falv.

    rv_falv->set_delay_change_selection(
      exporting
        time   =  rv_falv->delay_change_selection
      exceptions
        error  = 1
        others = 2
    ).
    if sy-subrc <> 0.
    endif.

    rv_falv->set_delay_move_current_cell(
      exporting
       time   = rv_falv->delay_move_current_cell
      exceptions
        error  = 1
        others = 2
    ).
    if sy-subrc <> 0.
    endif.

    rv_falv->set_output_table( CHANGING ct_table = ct_table ).
    rv_falv->fcat = rv_falv->lvc_fcat_from_itab( it_table = ct_table ).
    rv_falv->set_frontend_fieldcatalog( it_fieldcatalog = rv_falv->fcat ).
    rv_falv->application_log_embedded = i_applog_embedded.
    rv_falv->built_in_screen = built_in_screen.
    rv_falv->build_columns( ).
*Begin SMD
*  rv_falv->layout = new zcl_falv_layout( rv_falv ).
*  rv_falv->gui_status = new zcl_falv_dynamic_status( ).
*  rv_falv->screen = switch #( i_popup WHEN abap_true THEN c_screen_popup
*                                      WHEN abap_false THEN c_screen_full ).


    DATA: lo_layout TYPE REF TO zcl_falv_layout.
    CREATE OBJECT lo_layout
      EXPORTING
        io_falv = rv_falv.
    rv_falv->layout = lo_layout.
    DATA: lo_gui_status TYPE REF TO zcl_falv_dynamic_status.
    CREATE OBJECT lo_gui_status.
    rv_falv->gui_status = lo_gui_status.
    rv_falv->screen = lv_dynnr.
*End SMD

    IF built_in_screen EQ abap_true AND rv_falv->screen EQ c_screen_full.
      "default in full screen
      rv_falv->layout->set_no_toolbar( abap_true ).
    ENDIF.
    rv_falv->main_container ?= custom_container.
    rv_falv->split_container = split_container.
    rv_falv->variant-report = sy-repid.
    IF split_container IS NOT INITIAL.
      rv_falv->hide_applog( ).
    ENDIF.
*Begin SMD
*    Default initializations
    rv_falv->layout_save = 'A'.
    rv_falv->variant-report = sy-cprog. "This value should be informed as sy-repid when calling ZFALV
    rv_falv->variant-username = sy-uname.
    rv_falv->variant-handle = '0001'.
*End SMD
  ENDMETHOD.                    "create


METHOD create_by_copy.
    DATA: built_in_screen TYPE abap_bool.
*Begin SMD
    DATA: lv_dynnr TYPE sydynnr.
    IF i_popup = abap_true.
      lv_dynnr = c_screen_popup.
    ELSE.
      lv_dynnr = c_screen_full.
    ENDIF.
    DATA: custom_container TYPE REF TO cl_gui_custom_container,
          split_container TYPE REF TO cl_gui_splitter_container.
*End SMD
    DATA splitter_rows TYPE i.
*End SMD

    IF application_log_embedded EQ abap_true.
      " Create split container, log at bottom, grid at top.
      "Log hidden as default, will appear when error will be thrown.
      splitter_rows = 2.
    ELSE.
      splitter_rows = 1.
    ENDIF.

    "We need to call full screen ALV as container was not passed
    IF i_parent IS INITIAL.
      built_in_screen = abap_true.
      TRY.
*Begin SMD
*        data(custom_container) = new cl_gui_custom_container(
*            container_name = cc_name
*            dynnr          = SWITCH #( i_popup WHEN abap_true THEN c_screen_popup
*                                               WHEN abap_false THEN c_screen_full )
*            repid          = c_fscr_repid ).
          CREATE OBJECT custom_container
            EXPORTING
              container_name = cc_name
              dynnr          = lv_dynnr
              repid          = c_fscr_repid.
*End SMD

          " Create split container, log at bottom, grid at top.
          "Log hidden as default, will appear when error will be thrown.

          CREATE OBJECT split_container
            EXPORTING
              link_dynnr = lv_dynnr
              link_repid = c_fscr_repid
              parent     = custom_container
              rows       = splitter_rows
              columns    = 1.
*End SMD
          i_parent ?= split_container->get_container( row = 1 column    = 1 ).
          i_applogparent = split_container->get_container( row = 2 column    = 1 ).

        CATCH cx_root.
          "Something is wrong...
      ENDTRY.
    ELSE.
      custom_container ?= i_parent.
    ENDIF.

    IF me->subclass_type IS NOT INITIAL.
      DATA: subclass TYPE REF TO object.
*Begin SMD
*    data(sublcass_abs_name) = subclass_type->absolute_name.
      DATA: sublcass_abs_name TYPE abap_abstypename.
      sublcass_abs_name = subclass_type->absolute_name.
*End SMD
      CREATE OBJECT subclass TYPE (sublcass_abs_name)
        EXPORTING
          i_parent       = i_parent
          i_applogparent = i_applogparent.

      rv_falv ?= subclass.
      rv_falv->subclass_type = subclass_type.
    ELSE.
      CREATE OBJECT rv_falv
        EXPORTING
          i_parent       = i_parent
          i_applogparent = i_applogparent.
    ENDIF.

    SET HANDLER rv_falv->evf_after_refresh FOR rv_falv.
    SET HANDLER rv_falv->evf_after_user_command FOR rv_falv.
    SET HANDLER rv_falv->evf_before_ucommand_internal FOR rv_falv.
    SET HANDLER rv_falv->evf_before_user_command FOR rv_falv.
    SET HANDLER rv_falv->evf_button_click_falv FOR rv_falv.
    SET HANDLER rv_falv->evf_data_changed FOR rv_falv.
    SET HANDLER rv_falv->evf_data_changed_internal FOR rv_falv.
    SET HANDLER rv_falv->evf_data_changed_finished FOR rv_falv.
    SET HANDLER rv_falv->evf_double_click FOR rv_falv.
    SET HANDLER rv_falv->evf_hotspot_click FOR rv_falv.
    SET HANDLER rv_falv->evf_menu_button FOR rv_falv.
    SET HANDLER rv_falv->evf_onf1 FOR rv_falv.
    SET HANDLER rv_falv->evf_onf4 FOR rv_falv.
    SET HANDLER rv_falv->evf_subtotal_text FOR rv_falv.
    SET HANDLER rv_falv->evf_toolbar_internal FOR rv_falv.
    SET HANDLER rv_falv->evf_toolbar FOR rv_falv.
    SET HANDLER rv_falv->evf_user_command FOR rv_falv.
    SET HANDLER rv_falv->evf_user_command_internal FOR rv_falv.
    SET HANDLER rv_falv->evf_at_set_pf_status FOR rv_falv.
    SET HANDLER rv_falv->evf_at_set_title FOR rv_falv.
    SET HANDLER rv_falv->evf_top_of_page FOR rv_falv.
    SET HANDLER rv_falv->evf_delayed_callback FOR rv_falv.
    SET HANDLER rv_falv->evf_delayed_changed_sel_call FOR rv_falv.
    SET HANDLER rv_falv->evf_ondrag FOR rv_falv.
    SET HANDLER rv_falv->evf_ondrop FOR rv_falv.
    SET HANDLER rv_falv->evf_ondropcomplete FOR rv_falv.
    SET HANDLER rv_falv->evf_ondropgetflavor FOR rv_falv.
    SET HANDLER rv_falv->evf_drop_external_file FOR rv_falv.
    SET HANDLER rv_falv->evf_toolbar_menubutton_click FOR rv_falv.
    SET HANDLER rv_falv->evf_click_col_header FOR rv_falv.
    SET HANDLER rv_falv->evf_delayed_move_current_cell FOR rv_falv.
    SET HANDLER rv_falv->evf_f1 FOR rv_falv.
    SET HANDLER rv_falv->evf_dblclick_row_col FOR rv_falv.
    SET HANDLER rv_falv->evf_click_row_col FOR rv_falv.
    SET HANDLER rv_falv->evf_toolbar_button_click FOR rv_falv.
    SET HANDLER rv_falv->evf_double_click_col_separator FOR rv_falv.
    SET HANDLER rv_falv->evf_delayed_change_selection FOR rv_falv.
    SET HANDLER rv_falv->evf_context_menu FOR rv_falv.
    SET HANDLER rv_falv->evf_total_click_row_col FOR rv_falv.
    SET HANDLER rv_falv->evf_context_menu_selected FOR rv_falv.
    SET HANDLER rv_falv->evf_toolbar_menu_selected FOR rv_falv.

    rv_falv->set_delay_change_selection(
      EXPORTING
        time   =  me->delay_change_selection
      EXCEPTIONS
        error  = 1
        OTHERS = 2
    ).
    IF sy-subrc <> 0.
    ENDIF.

    rv_falv->set_delay_move_current_cell(
      EXPORTING
       time   = me->delay_move_current_cell
      EXCEPTIONS
        error  = 1
        OTHERS = 2
    ).
    IF sy-subrc <> 0.
    ENDIF.

    FIELD-SYMBOLS: <outtab> TYPE STANDARD TABLE.
    ASSIGN me->outtab->* TO <outtab>.
    rv_falv->set_output_table( CHANGING ct_table = <outtab> ).
    rv_falv->fcat = rv_falv->lvc_fcat_from_itab( it_table = <outtab> ).
    rv_falv->sort = me->sort.
    rv_falv->filter = me->filter.
    rv_falv->set_frontend_fieldcatalog( it_fieldcatalog = me->fcat ).
    rv_falv->application_log_embedded = application_log_embedded.
    rv_falv->built_in_screen = built_in_screen.
    rv_falv->build_columns( ).
*Begin SMD
*  rv_falv->layout = new zcl_falv_layout( io_falv = rv_falv ).
    DATA: lo_layout TYPE REF TO zcl_falv_layout.
    CREATE OBJECT lo_layout
      EXPORTING
        io_falv = rv_falv.
    rv_falv->layout = lo_layout.
*End SMD
    rv_falv->gui_status ?= me->gui_status->if_os_clone~clone( ). "clone object
    rv_falv->lvc_layout = me->lvc_layout.
    rv_falv->variant = me->variant.
*Begin SMD
*  rv_falv->screen = switch #( i_popup WHEN abap_true THEN c_screen_popup
*                                      WHEN abap_false THEN c_screen_full ).
    rv_falv->screen = lv_dynnr.
*End SMD

    rv_falv->main_container ?= custom_container.
    rv_falv->split_container = split_container.
    IF split_container IS NOT INITIAL.
      rv_falv->hide_applog( ).
    ENDIF.
    rv_falv->title_v1 = me->title_v1.
    rv_falv->title_v2 = me->title_v2.
    rv_falv->title_v3 = me->title_v3.
    rv_falv->title_v4 = me->title_v4.
    rv_falv->exclude_functions = me->exclude_functions.
    rv_falv->toolbar_added = me->toolbar_added.
    rv_falv->toolbar_deleted = me->toolbar_deleted.
    rv_falv->toolbar_disabled = me->toolbar_disabled.
  ENDMETHOD.                    "create_by_copy


METHOD delete_button.
    DELETE toolbar_added WHERE function = iv_function.
    IF sy-subrc NE 0.
*Begin SMD
*      insert value #( function = iv_function ) into table toolbar_deleted.
      DATA: ls_toolbar_deleted LIKE LINE OF toolbar_deleted.
      CLEAR: ls_toolbar_deleted.
      ls_toolbar_deleted-function = iv_function.
      INSERT ls_toolbar_deleted INTO TABLE toolbar_deleted.
*End SMD
      IF sy-subrc NE 0.
      ENDIF.
    ENDIF.
    me->refresh_toolbar( ).
  ENDMETHOD.                    "delete_button


METHOD disable_button.
*Begin SMD
*  TRY.
*      toolbar_added[ function = iv_function ]-disabled = abap_true.
*    CATCH cx_sy_itab_line_not_found.
*  ENDTRY.
*  INSERT value #( function = iv_function ) INTO TABLE toolbar_disabled.
    FIELD-SYMBOLS: <toolbar_added> LIKE LINE OF toolbar_added.
    DATA: ls_toolbar_added LIKE LINE OF toolbar_added.
    LOOP AT toolbar_added ASSIGNING <toolbar_added> WHERE function = iv_function.
      <toolbar_added>-disabled = abap_true.
    ENDLOOP.
    CLEAR: ls_toolbar_added.
    ls_toolbar_added-function = iv_function.
    INSERT ls_toolbar_added INTO TABLE toolbar_disabled.
*End SMD
    IF sy-subrc NE 0.
    ENDIF.
    me->refresh_toolbar( ).
  ENDMETHOD.                    "disable_button


METHOD display.
    FIELD-SYMBOLS: <outtab> TYPE STANDARD TABLE.
    IF built_in_screen EQ abap_true AND iv_force_grid EQ abap_false.
      IF screen EQ c_screen_popup AND iv_start_row IS INITIAL
                                  AND iv_start_column IS INITIAL
                                  AND iv_end_row IS INITIAL
                                  AND iv_end_column IS INITIAL.
        iv_start_row = 1.
        iv_start_column = 1.
        iv_end_row = 20.
        iv_end_column = 150.
      ENDIF.
      CALL FUNCTION 'Z_FALV_DISPLAY'
        EXPORTING
          io_falv         = me
          iv_start_row    = iv_start_row
          iv_start_column = iv_start_column
          iv_end_row      = iv_end_row
          iv_end_column   = iv_end_column.
      .
    ELSE.
      ASSIGN outtab->* TO <outtab>.
      me->set_table_for_first_display(
        EXPORTING
*            i_buffer_active               =     " Buffering Active
*            i_bypassing_buffer            =     " Switch Off Buffer
*            i_consistency_check           =     " Starting Consistency Check for Interface Error Recognition
*            i_structure_name              =     " Internal Output Table Structure Name
          is_variant                     =     variant
          i_save                        =      layout_save
*            i_default                     = 'X'    " Default Display Variant
          is_layout                     =      lvc_layout
*            is_print                      =     " Print Control
*            it_special_groups            =     " Field Groups
          it_toolbar_excluding          =     exclude_functions
*            it_hyperlink                  =     " Hyperlinks
*            it_alv_graphics               =     " Table of Structure DTC_S_TC
*            it_except_qinfo               =     " Table for Exception Quickinfo
*            ir_salv_adapter               =     " Interface ALV Adapter
        CHANGING
          it_outtab                     =    <outtab> " Output Table
          it_fieldcatalog               =     fcat
          it_sort                       =     sort " Sort Criteria
          it_filter                     =     filter " Filter Criteria
        EXCEPTIONS
          invalid_parameter_combination = 1
          program_error                 = 2
          too_many_lines                = 3
          OTHERS                        = 4
      ).
      IF sy-subrc EQ 0.
        IF split_container IS NOT INITIAL.
          split_container->set_focus(
            EXPORTING
              control           =     me
            EXCEPTIONS
              cntl_error        = 1
              cntl_system_error = 2
              OTHERS            = 3
          ).
          IF sy-subrc <> 0.
          ENDIF.
          me->hide_applog( ).
        ELSE.
          me->parent->set_focus(
            EXPORTING
              control           =  me
            EXCEPTIONS
              cntl_error        = 1
              cntl_system_error = 2
              OTHERS            = 3
          ).
          IF sy-subrc <> 0.
          ENDIF.
        ENDIF.
        cl_gui_cfw=>flush(
          EXCEPTIONS
            cntl_system_error = 1
            cntl_error        = 2
            OTHERS            = 3
        ).
        IF sy-subrc <> 0.
        ENDIF.
        me->set_visible( abap_true ).
        me->parent->set_visible( abap_true ).
        me->main_container->set_visible( abap_true ).
        IF me->split_container IS NOT INITIAL.
          me->split_container->set_visible( abap_true ).
        ENDIF.
      ENDIF.
    ENDIF.
  ENDMETHOD.                    "display


METHOD enable_button.
*Begin SMD
*    try.
*        toolbar_added[ function = iv_function ]-disabled = abap_false.
*      catch cx_sy_itab_line_not_found.
*    endtry.
    FIELD-SYMBOLS: <toolbar_added> LIKE LINE OF toolbar_added.
    LOOP AT toolbar_added ASSIGNING <toolbar_added> WHERE function = iv_function.
      <toolbar_added>-disabled = abap_false.
    ENDLOOP.
*End SMD
    DELETE toolbar_disabled WHERE function = iv_function.
    me->refresh_toolbar( ).
  ENDMETHOD.                    "enable_button


METHOD evf_after_refresh.
  ENDMETHOD.                    "evf_after_refresh


METHOD evf_after_user_command.
  ENDMETHOD.                    "evf_after_user_command


METHOD evf_at_set_pf_status.
  ENDMETHOD.                    "evf_at_set_pf_status


METHOD evf_at_set_title.
  ENDMETHOD.                    "evf_at_set_title


METHOD evf_before_ucommand_internal.
    FIELD-SYMBOLS: <outtab> TYPE STANDARD TABLE.
*Begin SMD
    FIELD-SYMBOLS: <fcat> LIKE LINE OF fcat,
                   <line> TYPE any,
                   <mark> TYPE any.
*End SMD
    CASE e_ucomm.
      WHEN me->mc_fc_select_all.

        IF layout->mark_field IS NOT INITIAL. " SMD and
*Begin SMD
*        line_exists( fcat[ fieldname = layout->mark_field CHECKBOX = abap_true ] ).
          READ TABLE fcat ASSIGNING <fcat> WITH KEY fieldname = layout->mark_field checkbox = abap_true.
          IF sy-subrc EQ 0.
*End SMD
            ASSIGN outtab->* TO <outtab>.
*Begin SMD
*          LOOP AT <outtab> ASSIGNING field-symbol(<line>).
            LOOP AT <outtab> ASSIGNING <line>.
*            ASSIGN COMPONENT layout->mark_field OF STRUCTURE <line> TO field-symbol(<mark>).
              ASSIGN COMPONENT layout->mark_field OF STRUCTURE <line> TO <mark>.
*End SMD
              IF sy-subrc EQ 0.
                <mark> = abap_true.
              ENDIF.
            ENDLOOP.
            me->soft_refresh( ).
            set_user_command( i_ucomm = space ).
*Begin SMD
          ENDIF.
*End SMD
        ENDIF.
      WHEN me->mc_fc_deselect_all.
        IF layout->mark_field IS NOT INITIAL. "SMD and
*Begin SMD
*        line_exists( fcat[ fieldname = layout->mark_field CHECKBOX = abap_true ] ).
          READ TABLE fcat ASSIGNING <fcat> WITH KEY fieldname = layout->mark_field checkbox = abap_true.
          IF sy-subrc EQ 0.
*End SMD
            ASSIGN outtab->* TO <outtab>.
            LOOP AT <outtab> ASSIGNING <line>.
              ASSIGN COMPONENT layout->mark_field OF STRUCTURE <line> TO <mark>.
              IF sy-subrc EQ 0.
                <mark> = abap_false.
              ENDIF.
            ENDLOOP.
            me->soft_refresh( ).
            set_user_command( i_ucomm = space ).
*Begin SMD
          ENDIF.
*End SMD
        ENDIF.
    ENDCASE.
  ENDMETHOD.                    "evf_before_ucommand_internal


METHOD evf_before_user_command.
  ENDMETHOD.                    "evf_before_user_command


METHOD evf_button_click_falv.
  ENDMETHOD.                    "evf_button_click_falv


METHOD evf_click_col_header.

  ENDMETHOD.                    "EVF_CLICK_COL_HEADER


METHOD evf_click_row_col.

  ENDMETHOD.                    "EVF_CLICK_ROW_COL


METHOD evf_context_menu.

  ENDMETHOD.                    "EVF_CONTEXT_MENU


METHOD evf_context_menu_selected.

  ENDMETHOD.                    "EVF_CONTEXT_MENU_SELECTED


METHOD evf_data_changed.

  ENDMETHOD.                    "evf_data_changed


METHOD evf_data_changed_finished.
  ENDMETHOD.                    "evf_data_changed_finished


METHOD evf_data_changed_internal.
    IF er_data_changed->mt_protocol IS NOT INITIAL.
      show_applog( ).
    ELSE.
      hide_applog( ).
    ENDIF.
  ENDMETHOD.                    "evf_data_changed_internal


METHOD evf_dblclick_row_col.

  ENDMETHOD.                    "EVF_DBLCLICK_ROW_COL


METHOD evf_delayed_callback.

  ENDMETHOD.                    "evf_delayed_callback


METHOD evf_delayed_changed_sel_call.

  ENDMETHOD.                    "evf_delayed_changed_sel_call


METHOD evf_delayed_change_selection.

  ENDMETHOD.                    "EVF_DELAYED_CHANGE_SELECTION


METHOD evf_delayed_move_current_cell.

  ENDMETHOD.                    "EVF_DELAYED_MOVE_CURRENT_CELL


METHOD evf_double_click.
  ENDMETHOD.                    "evf_double_click


METHOD evf_double_click_col_separator.

  ENDMETHOD.                    "EVF_DOUBLE_CLICK_COL_SEPARATOR


METHOD evf_drop_external_file.

  ENDMETHOD.                    "evf_drop_external_file


METHOD evf_f1.

  ENDMETHOD.                    "EVF_F1


METHOD evf_hotspot_click.
  ENDMETHOD.                    "evf_hotspot_click


METHOD evf_menu_button.
  ENDMETHOD.                    "evf_menu_button


METHOD evf_ondrag.

  ENDMETHOD.                    "evf_ondrag


METHOD evf_ondrop.

  ENDMETHOD.                    "evf_ondrop


METHOD evf_ondropcomplete.

  ENDMETHOD.                    "evf_ondropcomplete


METHOD evf_ondropgetflavor.

  ENDMETHOD.                    "evf_ondropgetflavor


METHOD evf_onf1.
  ENDMETHOD.                    "evf_onf1


METHOD evf_onf4.
  ENDMETHOD.                    "evf_onf4


METHOD evf_subtotal_text.
  ENDMETHOD.                    "evf_subtotal_text


METHOD evf_toolbar.

  ENDMETHOD.                    "evf_toolbar


METHOD evf_toolbar_button_click.

  ENDMETHOD.                    "EVF_TOOLBAR_BUTTON_CLICK


METHOD evf_toolbar_internal.
*Begin SMD
    FIELD-SYMBOLS: <toolbar> LIKE LINE OF e_object->mt_toolbar,
                   <tb> LIKE LINE OF toolbar_added.
    DATA: tabix TYPE sy-tabix.
*End SMD
*Begin SMD
*    loop at toolbar_added assigning field-symbol(<tb>).
    LOOP AT toolbar_added ASSIGNING <tb>.
*End SMD
      INSERT <tb> INTO TABLE e_object->mt_toolbar[].
    ENDLOOP.
    LOOP AT toolbar_disabled ASSIGNING <tb>.
*Begin SMD
*      try.
*          e_object->mt_toolbar[ function = <tb>-function ]-disabled = abap_true.
*        catch cx_sy_itab_line_not_found.
*
*      endtry.
      LOOP AT e_object->mt_toolbar ASSIGNING <toolbar> WHERE function = <tb>-function.
        <toolbar>-disabled = abap_true.
      ENDLOOP.
*End SMD
    ENDLOOP.
    LOOP AT toolbar_deleted ASSIGNING <tb>.
*Begin SMD
*      data(tabix) = sy-tabix.
      tabix = sy-tabix.
*End SMD
      DELETE e_object->mt_toolbar WHERE function = <tb>-function.
      IF sy-subrc NE 0.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.                    "evf_toolbar_internal


METHOD evf_toolbar_menubutton_click.

  ENDMETHOD.                    "EVF_TOOLBAR_MENUBUTTON_CLICK


METHOD evf_toolbar_menu_selected.

  ENDMETHOD.                    "EVF_TOOLBAR_MENU_SELECTED


METHOD evf_top_of_page.

  ENDMETHOD.                    "evf_top_of_page


METHOD evf_total_click_row_col.

  ENDMETHOD.                    "EVF_TOTAL_CLICK_ROW_COL


METHOD evf_user_command.

  ENDMETHOD.                    "evf_user_command


METHOD evf_user_command_internal.
    CASE e_ucomm.
      WHEN fc_back.
        LEAVE TO SCREEN 0.
      WHEN fc_exit.
        LEAVE TO SCREEN 0.
      WHEN fc_up.
        LEAVE TO SCREEN 0.
      WHEN fc_cancel.
        LEAVE TO SCREEN 0.
      WHEN fc_mass_replace.
        mass_replace( ).
    ENDCASE.
  ENDMETHOD.                    "evf_user_command_internal


METHOD exclude_function.
*Begin SMD
    FIELD-SYMBOLS: <exclude_functions> LIKE LINE OF exclude_functions.
*    if not line_exists( exclude_functions[ table_line = iv_ucomm ] ).
    READ TABLE exclude_functions ASSIGNING <exclude_functions> WITH KEY table_line = iv_ucomm.
    IF sy-subrc NE 0.
*End SMD
      INSERT iv_ucomm INTO TABLE exclude_functions.
    ENDIF.
  ENDMETHOD.                    "exclude_function


METHOD hide_applog.
    IF split_container IS NOT INITIAL.
      split_container->set_row_sash(
        EXPORTING
          id                =  1   " Row Splitter Bar ID
          type              =  split_container->type_sashvisible   " Attribute
          value             =  0   " Value
        EXCEPTIONS
          cntl_error        = 1
          cntl_system_error = 2
          OTHERS            = 3
      ).
      IF sy-subrc <> 0.
      ENDIF.
      split_container->set_row_height(
        EXPORTING
          id                =   2 " Row ID
          height            =   0  " Height
        EXCEPTIONS
          cntl_error        = 1
          cntl_system_error = 2
          OTHERS            = 3
      ).
      IF sy-subrc <> 0.
      ENDIF.
    ENDIF.
  ENDMETHOD.                    "hide_applog


METHOD if_os_clone~clone.
    SYSTEM-CALL OBJMGR CLONE me TO result.
  ENDMETHOD.                    "if_os_clone~clone


METHOD lvc_fcat_from_itab.
    DATA: table TYPE REF TO data.
*Begin SMD
    FIELD-SYMBOLS: <table> TYPE STANDARD TABLE.
*End SMD
    CREATE DATA table LIKE it_table.
*Begin SMD
*    assign table->* to field-symbol(<table>).
    ASSIGN table->* TO <table>.

    DATA: salv_table TYPE REF TO cl_salv_table.
*End SMD
    TRY.
        cl_salv_table=>factory( IMPORTING
*Begin SMD
*                                r_salv_table   = data(salv_table)
                                  r_salv_table   = salv_table
*End SMD
                                CHANGING
                                  t_table        = <table>  ).
        rt_fcat = cl_salv_controller_metadata=>get_lvc_fieldcatalog(
            r_columns      = salv_table->get_columns( ) " ALV Filter
            r_aggregations = salv_table->get_aggregations( ) " ALV Aggregations
    ).
      CATCH cx_root.
    ENDTRY.
  ENDMETHOD.                    "lvc_fcat_from_itab


METHOD mass_replace.
    FIELD-SYMBOLS: <outtab> TYPE STANDARD TABLE.
    ASSIGN outtab->* TO <outtab>.
    IF sy-subrc EQ 0.
*Begin SMD
      DATA: lo_grid TYPE REF TO cl_gui_alv_grid.
      lo_grid ?= me.
*End SMD
      CALL FUNCTION 'Z_FALV_MASS_REPLACE'
        EXPORTING
*Begin SMD
*          io_grid   = cast cl_gui_alv_grid( me )
          io_grid   = lo_grid
*End SMD
        CHANGING
          ct_outtab = <outtab>.

    ENDIF.
  ENDMETHOD.                    "mass_replace


METHOD pai.
    RAISE EVENT user_command EXPORTING e_ucomm = c_ucomm.

    me->set_function_code(
       CHANGING
         c_ucomm = c_ucomm ).
  ENDMETHOD.                    "pai


METHOD pbo.

    gui_status->show_gui_status( ).
    RAISE EVENT at_set_pf_status .

    gui_status->show_title(
      EXPORTING
        iv_text1 = title_v1
        iv_text2 = title_v2
        iv_text3 = title_v3
        iv_text4 = title_v4
        iv_text5 = title_v5
    ).
    RAISE EVENT at_set_title.

  ENDMETHOD.                    "pbo


METHOD refresh_toolbar.
    TRY.
        me->set_toolbar_interactive(  ).
      CATCH cx_root.
        "in case method is called before the display of grid
        "no need to do anything with that
    ENDTRY.
  ENDMETHOD.                    "refresh_toolbar


METHOD set_cell_button.
    FIELD-SYMBOLS: <outtab> TYPE STANDARD TABLE,
                   <styles> TYPE lvc_t_styl.
*Begin SMD
    FIELD-SYMBOLS: <row> TYPE any,
                   <fs_style> LIKE LINE OF <styles>.
    DATA: ls_style LIKE LINE OF <styles>.
*End SMD
    get_frontend_layout( IMPORTING es_layout =  lvc_layout ).
    CHECK lvc_layout-stylefname IS NOT INITIAL.
    ASSIGN outtab->* TO <outtab>.
    IF sy-subrc EQ 0.
*Begin SMD
*      assign <outtab>[ iv_row ] to field-symbol(<row>).
      READ TABLE <outtab> ASSIGNING <row> INDEX iv_row.
*End SMD
      IF sy-subrc EQ 0.
        ASSIGN COMPONENT lvc_layout-stylefname OF STRUCTURE <row> TO <styles>.
        IF sy-subrc EQ 0.
*Begin SMD
*          try.
*              <styles>[ fieldname = iv_fieldname ]-style = mc_style_button.
*            catch cx_sy_itab_line_not_found.
*              insert value #( fieldname = iv_fieldname style = mc_style_button ) into table <styles>.
*          endtry.
          LOOP AT <styles> ASSIGNING <fs_style> WHERE fieldname = iv_fieldname.
            <fs_style>-style = mc_style_button.
          ENDLOOP.
          IF sy-subrc NE 0.
            CLEAR: ls_style.
            ls_style-fieldname = iv_fieldname.
            ls_style-style = mc_style_button.
            INSERT ls_style INTO TABLE <styles>.
          ENDIF.
*End SMD
        ENDIF.
      ENDIF.
    ENDIF.
  ENDMETHOD.                    "set_cell_button


METHOD set_cell_color.
    FIELD-SYMBOLS: <outtab> TYPE STANDARD TABLE,
                   <colors> TYPE lvc_t_scol.
*Begin SMD
    FIELD-SYMBOLS: <row> TYPE any,
                   <fs_color> LIKE LINE OF <colors>.
    DATA: ls_color LIKE LINE OF <colors>.
*End SMD
    get_frontend_layout( IMPORTING es_layout =  lvc_layout ).
    CHECK lvc_layout-ctab_fname IS NOT INITIAL.
    ASSIGN outtab->* TO <outtab>.
    IF sy-subrc EQ 0.
*Begin SMD
*      assign <outtab>[ iv_row ] to field-symbol(<row>).
      READ TABLE <outtab> ASSIGNING <row> INDEX iv_row.
*End SMD
      IF sy-subrc EQ 0.
        ASSIGN COMPONENT lvc_layout-ctab_fname OF STRUCTURE <row> TO <colors>.
        IF sy-subrc EQ 0.
*Begin SMD
*          try.
*              <colors>[ fname = iv_fieldname ]-color = iv_color.
*            catch cx_sy_itab_line_not_found.
*              insert value #( fname = iv_fieldname color = iv_color ) into table <colors>.
*          endtry.
          LOOP AT <colors> ASSIGNING <fs_color> WHERE fname = iv_fieldname.
            <fs_color>-color = iv_color.
          ENDLOOP.
          IF sy-subrc NE 0.
            CLEAR: ls_color.
            ls_color-fname = iv_fieldname.
            ls_color-color = iv_color.
            INSERT ls_color INTO TABLE <colors>.
          ENDIF.
*End SMD
        ENDIF.
      ENDIF.
    ENDIF.
  ENDMETHOD.                    "set_cell_color


METHOD set_cell_disabled.
    FIELD-SYMBOLS: <outtab> TYPE STANDARD TABLE,
                   <styles> TYPE lvc_t_styl.
*Begin SMD
    FIELD-SYMBOLS: <row> TYPE any,
                   <fs_style> LIKE LINE OF <styles>.
    DATA: ls_style LIKE LINE OF <styles>.
*End SMD
    get_frontend_layout( IMPORTING es_layout =  lvc_layout ).
    CHECK lvc_layout-stylefname IS NOT INITIAL.
    ASSIGN outtab->* TO <outtab>.
    IF sy-subrc EQ 0.
*Begin SMD
*    ASSIGN <outtab>[ iv_row ] TO field-symbol(<row>).
      READ TABLE <outtab> ASSIGNING <row> INDEX iv_row.
*End SMD
      IF sy-subrc EQ 0.
        ASSIGN COMPONENT lvc_layout-stylefname OF STRUCTURE <row> TO <styles>.
        IF sy-subrc EQ 0.
*Begin SMD
*          try.
*              <styles>[ fieldname = iv_fieldname ]-style = mc_style_disabled.
*            catch cx_sy_itab_line_not_found.
*              insert value #( fieldname = iv_fieldname style = mc_style_disabled ) into table <styles>.
*          endtry.
          LOOP AT <styles> ASSIGNING <fs_style> WHERE fieldname = iv_fieldname.
            <fs_style>-style = mc_style_disabled.
          ENDLOOP.
          IF sy-subrc NE 0.
            CLEAR: ls_style.
            ls_style-fieldname = iv_fieldname.
            ls_style-style = mc_style_disabled.
            INSERT ls_style INTO TABLE <styles>.
          ENDIF.
*End SMD
        ENDIF.
      ENDIF.
    ENDIF.
  ENDMETHOD.                    "set_cell_disabled


METHOD set_cell_enabled.
    FIELD-SYMBOLS: <outtab> TYPE STANDARD TABLE,
                   <styles> TYPE lvc_t_styl.
*Begin SMD
    FIELD-SYMBOLS: <row> TYPE any,
                   <fs_style> LIKE LINE OF <styles>.
    DATA: ls_style LIKE LINE OF <styles>.
*End SMD
    get_frontend_layout( IMPORTING es_layout =  lvc_layout ).
    CHECK lvc_layout-stylefname IS NOT INITIAL.
    ASSIGN outtab->* TO <outtab>.
    IF sy-subrc EQ 0.
*Begin SMD
*      assign <outtab>[ iv_row ] to field-symbol(<row>).
      READ TABLE <outtab> ASSIGNING <row> INDEX iv_row.
*End SMD
      IF sy-subrc EQ 0.
        ASSIGN COMPONENT lvc_layout-stylefname OF STRUCTURE <row> TO <styles>.
        IF sy-subrc EQ 0.
*Begin SMD
*          try.
*              <styles>[ fieldname = iv_fieldname ]-style = mc_style_enabled.
*            catch cx_sy_itab_line_not_found.
*              insert value #( fieldname = iv_fieldname style = mc_style_enabled ) into table <styles>.
*          endtry.
          LOOP AT <styles> ASSIGNING <fs_style> WHERE fieldname = iv_fieldname.
            <fs_style>-style = mc_style_enabled.
          ENDLOOP.
          IF sy-subrc NE 0.
            CLEAR: ls_style.
            ls_style-fieldname = iv_fieldname.
            ls_style-style = mc_style_enabled.
            INSERT ls_style INTO TABLE <styles>.
          ENDIF.
*End SMD
        ENDIF.
      ENDIF.
    ENDIF.
  ENDMETHOD.                    "set_cell_enabled


METHOD set_cell_hotspot.
    FIELD-SYMBOLS: <outtab> TYPE STANDARD TABLE,
                   <styles> TYPE lvc_t_styl.
*Begin SMD
    FIELD-SYMBOLS: <row> TYPE any,
                   <fs_style> LIKE LINE OF <styles>.
    DATA: ls_style LIKE LINE OF <styles>.
*End SMD
    get_frontend_layout( IMPORTING es_layout =  lvc_layout ).
    CHECK lvc_layout-stylefname IS NOT INITIAL.
    ASSIGN outtab->* TO <outtab>.
    IF sy-subrc EQ 0.
*Begin SMD
*      assign <outtab>[ iv_row ] to field-symbol(<row>).
      READ TABLE <outtab> ASSIGNING <row> INDEX iv_row.
*End SMD
      IF sy-subrc EQ 0.
        ASSIGN COMPONENT lvc_layout-stylefname OF STRUCTURE <row> TO <styles>.
        IF sy-subrc EQ 0.
*Begin SMD
*          try.
*              <styles>[ fieldname = iv_fieldname ]-style = mc_style_hotspot.
*            catch cx_sy_itab_line_not_found.
*              insert value #( fieldname = iv_fieldname style = mc_style_hotspot ) into table <styles>.
*          endtry.
          LOOP AT <styles> ASSIGNING <fs_style> WHERE fieldname = iv_fieldname.
            <fs_style>-style = mc_style_hotspot.
          ENDLOOP.
          IF sy-subrc NE 0.
            CLEAR: ls_style.
            ls_style-fieldname = iv_fieldname.
            ls_style-style = mc_style_hotspot.
            INSERT ls_style INTO TABLE <styles>.
          ENDIF.
*End SMD
        ENDIF.
      ENDIF.
    ENDIF.
  ENDMETHOD.                    "set_cell_hotspot


METHOD set_editable.
    me->set_ready_for_input( i_ready_for_input = 1 ).
    IF iv_modify EQ abap_true.
      me->register_edit_event(
        EXPORTING
          i_event_id =  me->mc_evt_modified
        EXCEPTIONS
          error      = 1
          OTHERS     = 2
      ).
      IF sy-subrc <> 0.
*        message id sy-msgid type sy-msgty number sy-msgno
*                   with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
      ENDIF.
    ELSE.
      me->register_edit_event(
        EXPORTING
          i_event_id =  me->mc_evt_enter
        EXCEPTIONS
          error      = 1
          OTHERS     = 2
      ).
      IF sy-subrc <> 0.
*        message id sy-msgid type sy-msgty number sy-msgno
*                   with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
      ENDIF.
    ENDIF.
  ENDMETHOD.                    "set_editable


METHOD set_frontend_fieldcatalog.
    fcat = it_fieldcatalog.
    super->set_frontend_fieldcatalog( fcat ).
  ENDMETHOD.                    "set_frontend_fieldcatalog


METHOD set_frontend_layout.
    lvc_layout = is_layout.
    super->set_frontend_layout( is_layout ).
  ENDMETHOD.                    "set_frontend_layout


METHOD set_mark_field.
*Begin SMD
    FIELD-SYMBOLS: <fcat> LIKE LINE OF fcat.
*    if line_exists( fcat[ fieldname = iv_fieldname ] ).
    READ TABLE fcat ASSIGNING <fcat> WITH KEY fieldname = iv_fieldname.
    IF sy-subrc EQ 0.
*End SMD
      layout->mark_field = iv_fieldname.
      CHECK iv_fieldname IS NOT INITIAL.
      column( iv_fieldname )->set_checkbox( abap_true ).
    ENDIF.
  ENDMETHOD.                    "set_mark_field


METHOD set_output_table.
    GET REFERENCE OF ct_table INTO outtab.
  ENDMETHOD.                    "set_output_table


METHOD set_parent.
    me->parent ?= io_parent.
  ENDMETHOD.                    "set_parent


METHOD set_readonly.
    me->set_ready_for_input( i_ready_for_input = 1 ).
  ENDMETHOD.                    "set_readonly


METHOD set_row_color.
    FIELD-SYMBOLS: <outtab> TYPE STANDARD TABLE,
                   <color>  TYPE char04.
*Begin SMD
    FIELD-SYMBOLS: <row> TYPE any.
*End SMD
    get_frontend_layout( IMPORTING es_layout =  lvc_layout ).
    CHECK lvc_layout-info_fname IS NOT INITIAL.
    ASSIGN outtab->* TO <outtab>.
    IF sy-subrc EQ 0.
*Begin SMD
*      assign <outtab>[ iv_row ] to field-symbol(<row>).
      READ TABLE <outtab> ASSIGNING <row> INDEX iv_row.
*End SMD
      IF sy-subrc EQ 0.
        ASSIGN COMPONENT lvc_layout-info_fname OF STRUCTURE <row> TO <color>.
        IF sy-subrc EQ 0.
          <color> = iv_color.
        ENDIF.
      ENDIF.
    ENDIF.
  ENDMETHOD.                    "set_row_color


METHOD show_applog.
    IF split_container IS NOT INITIAL.
      split_container->set_row_sash(
        EXPORTING
          id                =  1   " Row Splitter Bar ID
          type              =  split_container->type_sashvisible   " Attribute
          value             =  1   " Value
        EXCEPTIONS
          cntl_error        = 1
          cntl_system_error = 2
          OTHERS            = 3
      ).
      IF sy-subrc <> 0.
      ENDIF.
      split_container->get_row_height(
        EXPORTING
          id                =  2   " Row ID
        IMPORTING
          result            =  height   " Result Code
        EXCEPTIONS
          cntl_error        = 1
          cntl_system_error = 2
          OTHERS            = 3
      ).
      IF sy-subrc EQ 0 AND height EQ 0.
        split_container->set_row_height(
          EXPORTING
            id                =   2 " Row ID
            height            =   15  " Height
          IMPORTING
            result           = result
          EXCEPTIONS
            cntl_error        = 1
            cntl_system_error = 2
            OTHERS            = 3
        ).
        IF sy-subrc <> 0.
        ENDIF.
      ENDIF.
    ENDIF.
  ENDMETHOD.                    "show_applog


METHOD soft_refresh.
*Begin SMD
    DATA: ls_stable TYPE lvc_s_stbl.
    CLEAR: ls_stable.
    ls_stable-row = 'X'.
    ls_stable-col = 'X'.
*End SMD
    me->refresh_table_display(
      EXPORTING
*Begin SMD
*        is_stable      =     conv #('XX') " With Stable Rows/Columns
        is_stable      =     ls_stable " With Stable Rows/Columns
*End SMD
        i_soft_refresh =     abap_true" Without Sort, Filter, etc.
      EXCEPTIONS
        finished       = 1
        OTHERS         = 2
    ).
    IF sy-subrc <> 0.
*     message id sy-msgid type sy-msgty number sy-msgno
*                with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    ENDIF.
  ENDMETHOD.                    "soft_refresh
ENDCLASS.
