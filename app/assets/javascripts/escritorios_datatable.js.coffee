window.crud_datatable = $('#escritorios_datatable').dataTable
  fnDrawCallback: (oSettings) ->
    gebo_datatables.draw_callback('#escritorios_datatable')
  sPaginationType: "bootstrap"
  bProcessing: true
  bServerSide: true
  aLengthMenu: [[10, 25, 50, 100, -1], [10, 25, 50, 100, terms['all']]]
  aaSorting: [[1, "desc"]]
  sAjaxSource: $('#escritorios_datatable').data('source')
  aoColumnDefs: [{ "bSortable": false, "aTargets": [ 0, 6 ] }]
  aoColumns: [
    {sClass: "center"},
    {sClass: "center", sName: "escritorios.id"},
 
    {sName: "escritorios.name"},

    {sName: "escritorios.cidade"},
 
    {sName: "escritorios.estado"},
 
    {sName: "advogados.name"},
    {sClass: "center"}
  ]
  "sDom": "<'dt_export_actions'><'dt_other_actions'T><'clear'>lfrti<'dt_batch_destroy_action'>p"
  "oTableTools":
    "sSwfPath": "/lib/datatables/extras/TableTools/media/swf/copy_csv_xls_pdf.swf"
    "aButtons": gebo_datatables.crud_buttons('#escritorios_datatable',[1, 2, 3, 4, 5])
  oLanguage:
    "sUrl": "/datatable/i18n"

window.advanced_search_columns = 
  id: 'integer'
 
  name: 'string'

  cidade: 'string'
 
  estado: 'string'
 
  advogados: 'n_to_n_2_columns'
