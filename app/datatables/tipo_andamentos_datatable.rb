class TipoAndamentosDatatable < GenericDatatable
  delegate :tipo_andamento_path, :edit_tipo_andamento_path, to: :@view

protected

  def total_records
    TipoAndamento.count
  end

  def data
    results.map do |tipo_andamento|
      [
        check_box_tag(:'ids[]', tipo_andamento.id),
        link_to(tipo_andamento.id,tipo_andamento_path(tipo_andamento), remote: true),
        input_text(tipo_andamento,tipo_andamento.name, :name),
        crud_buttons(tipo_andamento)
      ]
    end
  end

  def fetch_results
    results = build_result
      

    if merged_params[:sSearch].present?
      results = results.where("tipo_andamentos.id LIKE :search OR 
			tipo_andamentos.name LIKE :search", search: "%#{merged_params[:sSearch]}%")
    end
    results
  end

  def build_result
    if merged_params[:q].blank?
      results = TipoAndamento.unscoped
    else
      results = TipoAndamento.search(merged_params[:q]).result
    end

    results.order(sort_columns('tipo_andamentos.id')).page(page).per_page(per_page)
  end
end