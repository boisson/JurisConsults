window.crud_datatable = $('#processos_datatable').dataTable
  fnDrawCallback: (oSettings) ->
    gebo_datatables.draw_callback('#processos_datatable')
  sPaginationType: "bootstrap"
  bProcessing: true
  bServerSide: true
  aLengthMenu: [[10, 25, 50, 100, -1], [10, 25, 50, 100, terms['all']]]
  aaSorting: [[1, "desc"]]
  sAjaxSource: $('#processos_datatable').data('source')
  aoColumnDefs: [{ "bSortable": false, "aTargets": [ 0, 11 ] }]
  aoColumns: [
    {sClass: "center"},
    {sClass: "center", sName: "processos.id"},
 
    {sName: "processos.numero"},
 
    {sName: "processos.ano"},
 
    {sName: "processos.data_inicio"},
 
    {sName: "processos.data_fim"},
 
    {sName: "clientes.name"},
 
    {sName: "reus.name"},
 
    {sName: "advogados.name"},
 
    {sName: "locals.name"},
 
    {sName: "tipo_processos.name"},

    {sClass: "center"}
  ]
  "sDom": "<'dt_export_actions'><'dt_other_actions'T><'clear'>lfrti<'dt_batch_destroy_action'>p"
  "oTableTools":
    "sSwfPath": "/lib/datatables/extras/TableTools/media/swf/copy_csv_xls_pdf.swf"
    "aButtons": gebo_datatables.crud_buttons('#processos_datatable',[1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
  oLanguage:
    "sUrl": "/datatable/i18n"

window.advanced_search_columns = 
  id: 'integer'
 
  numero: 'string'
 
  ano: 'string'
 
  data_inicio: 'date'
 
  data_fim: 'date'
 
  cliente: 'references'
 
  reu: 'references'
 
  advogado: 'references'
 
  local: 'references'
 
  tipo_processo: 'references'
