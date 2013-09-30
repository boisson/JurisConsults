window.crud_datatable = $('#advogados_escritorios_datatable').dataTable
  fnDrawCallback: (oSettings) ->
    gebo_datatables.draw_callback('#advogados_escritorios_datatable')
  sPaginationType: "bootstrap"
  bProcessing: true
  bServerSide: true
  aLengthMenu: [[10, 25, 50, 100, -1], [10, 25, 50, 100, terms['all']]]
  aaSorting: [[1, "desc"]]
  sAjaxSource: $('#advogados_escritorios_datatable').data('source')
  aoColumnDefs: [{ "bSortable": false, "aTargets": [ 0, 4 ] }]
  aoColumns: [
    {sClass: "center"},
    {sClass: "center", sName: "advogados_escritorios.id"},
 
    {sName: "escritorios.name"},
 
    {sName: "advogados.name"},
    {sClass: "center"}
  ]
  "sDom": "<'dt_export_actions'><'dt_other_actions'T><'clear'>lfrti<'dt_batch_destroy_action'>p"
  "oTableTools":
    "sSwfPath": "/lib/datatables/extras/TableTools/media/swf/copy_csv_xls_pdf.swf"
    "aButtons": gebo_datatables.crud_buttons('#advogados_escritorios_datatable',[1, 2, 3])
  oLanguage:
    "sUrl": "/datatable/i18n"

window.advanced_search_columns = 
  id: 'integer'
 
  escritorio: 'references'
 
  advogado: 'references'
