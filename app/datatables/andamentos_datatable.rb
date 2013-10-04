class AndamentosDatatable < GenericDatatable
  delegate :andamento_path, :edit_andamento_path, to: :@view

protected

  def total_records
    Andamento.count
  end

  def data
    results.map do |andamento|
      [
        check_box_tag(:'ids[]', andamento.id),
        link_to(andamento.id,andamento_path(andamento), remote: true),
        ((andamento.processo.name rescue andamento.processo.id) if andamento.processo),
        input_date(andamento,(l(andamento.data) rescue nil), :data),
        input_text(andamento,andamento.prazo, :prazo),
        ((andamento.tipo_andamento.name rescue andamento.tipo_andamento.id) if andamento.tipo_andamento),
        ((andamento.situacao.name rescue andamento.situacao.id) if andamento.situacao),
        strip_tags(andamento.comentario),
        crud_buttons(andamento)
      ]
    end
  end

  def fetch_results
    results = build_result
      .joins('LEFT JOIN processos ON andamentos.processo_id = processos.id')
      .joins('LEFT JOIN tipo_andamentos ON andamentos.tipo_andamento_id = tipo_andamentos.id')
      .joins('LEFT JOIN situacaos ON andamentos.situacao_id = situacaos.id')
      

    if merged_params[:sSearch].present?
      results = results.where("andamentos.id LIKE :search OR 
			processos.id LIKE :search OR processos.name LIKE :search OR 
			andamentos.data LIKE :search OR 
			tipo_andamentos.id LIKE :search OR tipo_andamentos.name LIKE :search OR 
			situacaos.id LIKE :search OR situacaos.name LIKE :search OR 
			andamentos.comentario LIKE :search", search: "%#{merged_params[:sSearch]}%")
    end
    results
  end

  def build_result
    if merged_params[:q].blank?
      results = Andamento.unscoped
    else
      results = Andamento.search(merged_params[:q]).result
    end

    results.order(sort_columns('andamentos.id')).page(page).per_page(per_page)
  end
end