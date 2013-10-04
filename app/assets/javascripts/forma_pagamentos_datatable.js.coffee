window.crud_datatable = $('#forma_pagamentos_datatable').dataTable
  fnDrawCallback: (oSettings) ->
    gebo_datatables.draw_callback('#forma_pagamentos_datatable')
  sPaginationType: "bootstrap"
  bProcessing: true
  bServerSide: true
  aLengthMenu: [[10, 25, 50, 100, -1], [10, 25, 50, 100, terms['all']]]
  aaSorting: [[1, "desc"]]
  sAjaxSource: $('#forma_pagamentos_datatable').data('source')
  aoColumnDefs: [{ "bSortable": false, "aTargets": [ 0, 4 ] }]
  aoColumns: [
    {sClass: "center"},
    {sClass: "center", sName: "forma_pagamentos.id"},
 
    {sName: "forma_pagamentos.name"},
 
    {sName: "tipo_pagamentos.name"},
    {sClass: "center"}
  ]
  "sDom": "<'dt_export_actions'><'dt_other_actions'T><'clear'>lfrti<'dt_batch_destroy_action'>p"
  "oTableTools":
    "sSwfPath": "/lib/datatables/extras/TableTools/media/swf/copy_csv_xls_pdf.swf"
    "aButtons": gebo_datatables.crud_buttons('#forma_pagamentos_datatable',[1, 2, 3])
  oLanguage:
    "sUrl": "/datatable/i18n"

window.advanced_search_columns = 
  id: 'integer'
 
  name: 'string'
 
  tipo_pagamento: 'references'
