window.crud_datatable = $('#advogados_datatable').dataTable
  fnDrawCallback: (oSettings) ->
    gebo_datatables.draw_callback('#advogados_datatable')
  sPaginationType: "bootstrap"
  bProcessing: true
  bServerSide: true
  aLengthMenu: [[10, 25, 50, 100, -1], [10, 25, 50, 100, terms['all']]]
  aaSorting: [[1, "desc"]]
  sAjaxSource: $('#advogados_datatable').data('source')
  aoColumnDefs: [{ "bSortable": false, "aTargets": [ 0, 9 ] }]
  aoColumns: [
    {sClass: "center"},
    {sClass: "center", sName: "advogados.id"},
 
    {sName: "advogados.name"},

    {sName: "advogados.oab"},

    {sName: "advogados.cidade"},
 
    {sName: "advogados.estado"},

    {sName: "advogados.situacao"},
 
    {sName: "advogados.telefone"},
 
    {sName: "advogados.celular"},
    {sClass: "center"}
  ]
  "sDom": "<'dt_export_actions'><'dt_other_actions'T><'clear'>lfrti<'dt_batch_destroy_action'>p"
  "oTableTools":
    "sSwfPath": "/lib/datatables/extras/TableTools/media/swf/copy_csv_xls_pdf.swf"
    "aButtons": gebo_datatables.crud_buttons('#advogados_datatable',[1, 2, 3, 4, 5, 6, 7, 8, 9])
  oLanguage:
    "sUrl": "/datatable/i18n"

window.advanced_search_columns = 
  id: 'integer'
 
  name: 'string'
 
  cpf: 'string'
 
  oab: 'string'
 
  logradouro: 'string'
 
  numero: 'string'
 
  complemento: 'string'
 
  bairro: 'string'
 
  cidade: 'string'
 
  estado: 'string'
 
  cep: 'string'
 
  curriculo: 'text'
 
  comentario: 'text'
 
  situacao: 'string'
 
  telefone: 'string'
 
  celular: 'string'
