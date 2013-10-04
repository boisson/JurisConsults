window.crud_datatable = $('#contratos_datatable').dataTable
  fnDrawCallback: (oSettings) ->
    gebo_datatables.draw_callback('#contratos_datatable')
  sPaginationType: "bootstrap"
  bProcessing: true
  bServerSide: true
  aLengthMenu: [[10, 25, 50, 100, -1], [10, 25, 50, 100, terms['all']]]
  aaSorting: [[1, "desc"]]
  sAjaxSource: $('#contratos_datatable').data('source')
  aoColumnDefs: [{ "bSortable": false, "aTargets": [ 0, 7 ] }]
  aoColumns: [
    {sClass: "center"},
    {sClass: "center", sName: "contratos.id"},
 
    {sName: "contratos.name"},
 
    {sName: "processos.name"},
 
    {sName: "contratos.valor"},
 
    {sName: "forma_pagamentos.name"},
 
    {sName: "contratos.saldo"},
    {sClass: "center"}
  ]
  "sDom": "<'dt_export_actions'><'dt_other_actions'T><'clear'>lfrti<'dt_batch_destroy_action'>p"
  "oTableTools":
    "sSwfPath": "/lib/datatables/extras/TableTools/media/swf/copy_csv_xls_pdf.swf"
    "aButtons": gebo_datatables.crud_buttons('#contratos_datatable',[1, 2, 3, 4, 5, 6])
  oLanguage:
    "sUrl": "/datatable/i18n"

window.advanced_search_columns = 
  id: 'integer'
 
  name: 'string'
 
  processo: 'references'
 
  valor: 'float'
 
  forma_pagamento: 'references'
 
  saldo: 'float'
