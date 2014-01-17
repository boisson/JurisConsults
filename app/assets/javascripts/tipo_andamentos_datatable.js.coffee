window.crud_datatable = $('#tipo_andamentos_datatable').dataTable
  fnDrawCallback: (oSettings) ->
    gebo_datatables.draw_callback('#tipo_andamentos_datatable')
  sPaginationType: "bootstrap"
  bProcessing: true
  bServerSide: true
  aLengthMenu: [[10, 25, 50, 100, -1], [10, 25, 50, 100, terms['all']]]
  aaSorting: [[1, "desc"]]
  sAjaxSource: $('#tipo_andamentos_datatable').data('source')
  aoColumnDefs: [{ "bSortable": false, "aTargets": [ 0, 3 ] }]
  aoColumns: [
    {sClass: "center"},
    {sClass: "center", sName: "tipo_andamentos.id"},
    {sName: "tipo_andamentos.name"},
    {sClass: "center"}
  ]
  "sDom": "<'dt_export_actions'><'dt_other_actions'T><'clear'>lfrti<'dt_batch_destroy_action'>p"
  "oTableTools":
    "sSwfPath": "/lib/datatables/extras/TableTools/media/swf/copy_csv_xls_pdf.swf"
    "aButtons": gebo_datatables.crud_buttons('#tipo_andamentos_datatable',[1, 2])
  oLanguage:
    "sUrl": "/datatable/i18n"

window.advanced_search_columns = 
  id: 'integer'
 
  name: 'string'
