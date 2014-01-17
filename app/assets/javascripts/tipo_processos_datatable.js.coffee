window.crud_datatable = $('#tipo_processos_datatable').dataTable
  fnDrawCallback: (oSettings) ->
    gebo_datatables.draw_callback('#tipo_processos_datatable')
  sPaginationType: "bootstrap"
  bProcessing: true
  bServerSide: true
  aLengthMenu: [[10, 25, 50, 100, -1], [10, 25, 50, 100, terms['all']]]
  aaSorting: [[1, "desc"]]
  sAjaxSource: $('#tipo_processos_datatable').data('source')
  aoColumnDefs: [{ "bSortable": false, "aTargets": [ 0, 4 ] }]
  aoColumns: [
    {sClass: "center"},
    {sClass: "center", sName: "tipo_processos.id"},
    {sName: "tipo_processos.name"},
    {sName: "tipo_processos.formato"},
    {sClass: "center"}
  ]
  "sDom": "<'dt_export_actions'><'dt_other_actions'T><'clear'>lfrti<'dt_batch_destroy_action'>p"
  "oTableTools":
    "sSwfPath": "/lib/datatables/extras/TableTools/media/swf/copy_csv_xls_pdf.swf"
    "aButtons": gebo_datatables.crud_buttons('#tipo_processos_datatable',[1, 2, 3])
  oLanguage:
    "sUrl": "/datatable/i18n"

window.advanced_search_columns = 
  id: 'integer'
 
  name: 'string'
 
  formato: 'string'
