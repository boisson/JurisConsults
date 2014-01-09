window.crud_datatable = $('#acompanhamentos_datatable').dataTable
  fnDrawCallback: (oSettings) ->
    gebo_datatables.draw_callback('#acompanhamentos_datatable')
  sPaginationType: "bootstrap"
  bProcessing: true
  bServerSide: true
  aLengthMenu: [[10, 25, 50, 100, -1], [10, 25, 50, 100, terms['all']]]
  aaSorting: [[1, "desc"]]
  sAjaxSource: $('#acompanhamentos_datatable').data('source')
  aoColumnDefs: [{ "bSortable": false, "aTargets": [ 0, 6 ] }]
  aoColumns: [
    {sClass: "center"},
    {sClass: "center", sName: "acompanhamentos.id"},
 
    {sName: "contratos.name"},
 
    {sName: "acompanhamentos.data"},
 
    {sName: "acompanhamentos.hora"},
 
    {sName: "acompanhamentos.name"},
    {sClass: "center"}
  ]
  "sDom": "<'dt_export_actions'><'dt_other_actions'T><'clear'>lfrti<'dt_batch_destroy_action'>p"
  "oTableTools":
    "sSwfPath": "/lib/datatables/extras/TableTools/media/swf/copy_csv_xls_pdf.swf"
    "aButtons": gebo_datatables.crud_buttons('#acompanhamentos_datatable',[1, 2, 3, 4, 5])
  oLanguage:
    "sUrl": "/datatable/i18n"

window.advanced_search_columns = 
  id: 'integer'
 
  contratos: 'references'
 
  data: 'date'
 
  hora: 'time'
 
  name: 'string'