window.crud_datatable = $('#conta_correntes_datatable').dataTable
  fnDrawCallback: (oSettings) ->
    gebo_datatables.draw_callback('#conta_correntes_datatable')
  sPaginationType: "bootstrap"
  bProcessing: true
  bServerSide: true
  aLengthMenu: [[10, 25, 50, 100, -1], [10, 25, 50, 100, terms['all']]]
  aaSorting: [[1, "desc"]]
  sAjaxSource: $('#conta_correntes_datatable').data('source')
  aoColumnDefs: [{ "bSortable": false, "aTargets": [ 0, 7 ] }]
  aoColumns: [
    {sClass: "center"},
    {sClass: "center", sName: "conta_correntes.id"},
    {sName: "conta_correntes.date"},
    {sName: "contratos.name"},
    {sName: "tipo_lancamentos.name"},
    {sName: "conta_correntes.valor"},
    {sClass: "center"}
  ]
  "sDom": "<'dt_export_actions'><'dt_other_actions'T><'clear'>lfrti<'dt_batch_destroy_action'>p"
  "oTableTools":
    "sSwfPath": "/lib/datatables/extras/TableTools/media/swf/copy_csv_xls_pdf.swf"
    "aButtons": gebo_datatables.crud_buttons('#conta_correntes_datatable',[1, 2, 3, 4])
  oLanguage:
    "sUrl": "/datatable/i18n"

window.advanced_search_columns = 
  id: 'integer'
 
  date: 'timestamp'
 
  contrato: 'references'
 
  valor: 'float'
  
  tipo_pagamento: 'references'
  
  tipo_lancamento: 'references'
  
  forma_pagamento: 'references'
