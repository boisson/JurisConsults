window.crud_datatable = $('#<%=plural_table_name%>_datatable').dataTable
  fnDrawCallback: (oSettings) ->
    $(".crud_datatable input:checkbox.hide").each ->
      $(this).parent().dblclick ->
        gebo_datatables.save_boolean_field($(this).find('input:checkbox'))
    $(".crud_datatable input:text.hide").each ->
      $(this).parent().dblclick ->
        gebo_datatables.save_text_field($(this).find('input:text'))
    $(".crud_datatable span.hide.content-for-datepicker").each ->
      $(this).parent().dblclick ->
        gebo_datatables.save_date_field($(this).find('input:hidden:first'))
  sPaginationType: "bootstrap"
  bProcessing: true
  bServerSide: true
  aLengthMenu: [[10, 25, 50, 100, -1], [10, 25, 50, 100, "Todos"]]
  aaSorting: [[1, "desc"]]
  sAjaxSource: $('#<%=plural_table_name%>_datatable').data('source')
  aoColumnDefs: [{ "bSortable": false, "aTargets": [ 0, <%= attributes.size + 2 %> ] }]
  aoColumns: [
    {sClass: "center"},
    {sClass: "center", sName: "<%= plural_table_name %>.id"},
<% attributes.each do |t| -%> 
<% if t.type == :references -%>
    {sName: "<%= t.name.tableize %>.name"},
<% elsif t.type == :n_to_n_inline || t.type == :n_to_n_2_columns -%>
    {sName: "<%= t.name %>.name"},
<% else -%>
    {sName: "<%= plural_table_name %>.<%=t.name%>"},
<% end -%>
<% end -%>
    {sClass: "center"}
  ]
  "sDom": 'T<"clear">lfrtip'
  "oTableTools":
    "sSwfPath": "/lib/datatables/extras/TableTools/media/swf/copy_csv_xls_pdf.swf"
    "aButtons": [
      {
        "fnClick": ( nButton, oConfig, oFlash ) ->
          $('#modal-import').modal()
        'sButtonText' : terms['import'],
        "sExtends": "text"
      },
      {
        "fnClick": ( nButton, oConfig, oFlash ) ->
          gebo_datatables.export_print('#<%=plural_table_name%>_datatable')
        'sButtonText' : terms['print'],
        "sExtends": "text"
      },
      {
        "sExtends": "copy",
        'sButtonText' : terms['copy'],
        "mColumns": <%= (1..attributes.size+1).to_a.inspect %>
      },
      {
        "fnClick": ( nButton, oConfig, oFlash ) ->
          gebo_datatables.export_xlsx('#<%=plural_table_name%>_datatable')
        'sButtonText' : 'CSV',
        "sExtends": "text"
      },
      {
        "fnClick": ( nButton, oConfig, oFlash ) ->
          gebo_datatables.export_xlsx('#<%=plural_table_name%>_datatable')
        'sButtonText' : 'XLSX',
        "sExtends": "text"
      },
      {
        "fnClick": ( nButton, oConfig, oFlash ) ->
          gebo_datatables.export_pdf('#<%=plural_table_name%>_datatable')
        'sButtonText' : 'PDF',
        "sExtends": "text"
      }
    ]
  oLanguage:
    "sUrl": "/datatable/i18n"

window.advanced_search_columns = 
  id: 'integer'
<% attributes.each do |t| -%> 
  <%=t.name%>: '<%=t.type%>'
<% end %>