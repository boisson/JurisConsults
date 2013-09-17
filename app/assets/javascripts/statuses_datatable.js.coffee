window.crud_datatable = $('#statuses_datatable').dataTable
  fnDrawCallback: (oSettings) ->
    $(".crud_datatable input:checkbox.hide").each ->
      $(this).parent().dblclick ->
        gebo_datatables.save_boolean_field($(this).find('input:checkbox'))
    $(".crud_datatable input:text.hide").each ->
      $(this).parent().dblclick ->
        gebo_datatables.save_text_field($(this).find('input:text'))
    $(".crud_datatable span.hide.content-for-datepicker").each ->
      $(this).parent().dblclick ->
        gebo_datatables.save_date_field($(this).find('input:hidden:first'))
  sPaginationType: "bootstrap"
  bProcessing: true
  bServerSide: true
  aLengthMenu: [[10, 25, 50, 100, -1], [10, 25, 50, 100, "Todos"]]
  aaSorting: [[1, "desc"]]
  sAjaxSource: $('#statuses_datatable').data('source')
  aoColumnDefs: [{ "bSortable": false, "aTargets": [ 0, 3 ] }]
  aoColumns: [
    {sClass: "center"},
    {sClass: "center", sName: "statuses.id"},
 
    {sName: "statuses.name"},
    {sClass: "center"}
  ]
  "sDom": 'T<"clear">lfrtip'
  "oTableTools":
    "sSwfPath": "/lib/datatables/extras/TableTools/media/swf/copy_csv_xls_pdf.swf"
    "aButtons": [
      {
        "fnClick": ( nButton, oConfig, oFlash ) ->
          $('#modal-import').modal()
        'sButtonText' : terms['import'],
        "sExtends": "text"
      },
      {
        "fnClick": ( nButton, oConfig, oFlash ) ->
          gebo_datatables.export_print('#statuses_datatable')
        'sButtonText' : terms['print'],
        "sExtends": "text"
      },
      {
        "sExtends": "copy",
        'sButtonText' : terms['copy'],
        "mColumns": [1, 2]
      },
      {
        "fnClick": ( nButton, oConfig, oFlash ) ->
          gebo_datatables.export_xlsx('#statuses_datatable')
        'sButtonText' : 'CSV',
        "sExtends": "text"
      },
      {
        "fnClick": ( nButton, oConfig, oFlash ) ->
          gebo_datatables.export_xlsx('#statuses_datatable')
        'sButtonText' : 'XLSX',
        "sExtends": "text"
      },
      {
        "fnClick": ( nButton, oConfig, oFlash ) ->
          gebo_datatables.export_pdf('#statuses_datatable')
        'sButtonText' : 'PDF',
        "sExtends": "text"
      }
    ]
  oLanguage:
    "sUrl": "/datatable/i18n"

window.advanced_search_columns = 
  id: 'integer'
 
  name: 'string'
