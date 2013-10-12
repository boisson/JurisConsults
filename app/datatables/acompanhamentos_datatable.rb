class AcompanhamentosDatatable < GenericDatatable
  delegate :acompanhamento_path, :edit_acompanhamento_path, to: :@view

protected

  def total_records
    Acompanhamento.count
  end

  def data
    results.map do |acompanhamento|
      [
        check_box_tag(:'ids[]', acompanhamento.id),
        link_to(acompanhamento.id,acompanhamento_path(acompanhamento), remote: true),
        ((acompanhamento.contratos.name rescue acompanhamento.contratos.id) if acompanhamento.contratos),
        input_date(acompanhamento,(l(acompanhamento.data) rescue nil), :data),
        acompanhamento.hora,
        input_text(acompanhamento,acompanhamento.name, :name),
        crud_buttons(acompanhamento)
      ]
    end
  end

  def fetch_results
    results = build_result
      .joins('LEFT JOIN contratos ON acompanhamentos.contratos_id = contratos.id')
      

    if merged_params[:sSearch].present?
      results = results.where("acompanhamentos.id LIKE :search OR 
			contratos.id LIKE :search OR contratos.name LIKE :search OR 
			acompanhamentos.data LIKE :search OR 
			acompanhamentos.hora LIKE :search OR 
			acompanhamentos.name LIKE :search", search: "%#{merged_params[:sSearch]}%")
    end
    results
  end

  def build_result
    if merged_params[:q].blank?
      results = Acompanhamento.unscoped
    else
      results = Acompanhamento.search(merged_params[:q]).result
    end

    results.order(sort_columns('acompanhamentos.id')).page(page).per_page(per_page)
  end
end