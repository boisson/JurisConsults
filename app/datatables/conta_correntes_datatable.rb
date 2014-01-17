class ContaCorrentesDatatable < GenericDatatable
  delegate :conta_corrente_path, :edit_conta_corrente_path, to: :@view

protected

  def total_records
    ContaCorrente.count
  end

  def data
    results.map do |conta_corrente|
      [
        check_box_tag(:'ids[]', conta_corrente.id),
        link_to(conta_corrente.id,conta_corrente_path(conta_corrente), remote: true),
        conta_corrente.date,
        ((conta_corrente.contrato.name rescue conta_corrente.contrato.id) if conta_corrente.contrato),
        ((conta_corrente.tipo_lancamento.name rescue conta_corrente.tipo_lancamento.id) if conta_corrente.tipo_lancamento),
        input_text(conta_corrente,conta_corrente.valor, :valor),
        input_boolean(conta_corrente,yes_or_no(conta_corrente.confirmado), :confirmado),
        crud_buttons(conta_corrente)
      ]
    end
  end

  def fetch_results
    results = build_result
      .joins('LEFT JOIN contratos ON conta_correntes.contrato_id = contratos.id')
      

    if merged_params[:sSearch].present?
      results = results.where("conta_correntes.id LIKE :search OR 
			conta_correntes.date LIKE :search OR 
			contratos.id LIKE :search OR contratos.name LIKE :search OR 
			conta_correntes.valor LIKE :search", search: "%#{merged_params[:sSearch]}%")
    end
    results
  end

  def build_result
    if merged_params[:q].blank?
      results = ContaCorrente.unscoped
    else
      results = ContaCorrente.search(merged_params[:q]).result
    end

    results.order(sort_columns('conta_correntes.id')).page(page).per_page(per_page)
  end
end