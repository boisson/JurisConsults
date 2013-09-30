class ClientesDatatable < GenericDatatable
  delegate :cliente_path, :edit_cliente_path, to: :@view

protected

  def total_records
    Cliente.count
  end

  def data
    results.map do |cliente|
      [
        check_box_tag(:'ids[]', cliente.id),
        link_to(cliente.id,cliente_path(cliente), remote: true),
        input_text(cliente,cliente.name, :name),
         input_text(cliente,cliente.cidade, :cidade),
        input_text(cliente,cliente.estado, :estado),
         input_text(cliente,cliente.telefone, :telefone),
        input_text(cliente,cliente.celular, :celular),
        crud_buttons(cliente)
      ]
    end
  end

  def fetch_results
    results = build_result
      .joins('LEFT JOIN situacaos ON clientes.situacao_id = situacaos.id')
      

    if merged_params[:sSearch].present?
      results = results.where("clientes.id LIKE :search OR 
			clientes.name LIKE :search OR
			clientes.cidade LIKE :search OR 
			clientes.estado LIKE :search OR 
			clientes.telefone LIKE :search OR
			clientes.celular LIKE :search", search: "%#{merged_params[:sSearch]}%")
    end
    results
  end

  def build_result
    if merged_params[:q].blank?
      results = Cliente.unscoped
    else
      results = Cliente.search(merged_params[:q]).result
    end

    results.order(sort_columns('clientes.id')).page(page).per_page(per_page)
  end
end