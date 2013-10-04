class ContratosDatatable < GenericDatatable
  delegate :contrato_path, :edit_contrato_path, to: :@view

protected

  def total_records
    Contrato.count
  end

  def data
    results.map do |contrato|
      [
        check_box_tag(:'ids[]', contrato.id),
        link_to(contrato.id,contrato_path(contrato), remote: true),
        input_text(contrato,contrato.name, :name),
        ((contrato.processo.name rescue contrato.processo.id) if contrato.processo),
        input_text(contrato,contrato.valor, :valor),
        ((contrato.forma_pagamento.name rescue contrato.forma_pagamento.id) if contrato.forma_pagamento),
        input_text(contrato,contrato.saldo, :saldo),
        crud_buttons(contrato)
      ]
    end
  end

  def fetch_results
    results = build_result
      .joins('LEFT JOIN processos ON contratos.processo_id = processos.id')
      .joins('LEFT JOIN forma_pagamentos ON contratos.forma_pagamento_id = forma_pagamentos.id')
      

    if merged_params[:sSearch].present?
      results = results.where("contratos.id LIKE :search OR 
			contratos.name LIKE :search OR 
			processos.id LIKE :search OR processos.name LIKE :search OR 
			contratos.valor LIKE :search OR 
			forma_pagamentos.id LIKE :search OR forma_pagamentos.name LIKE :search OR 
			contratos.saldo LIKE :search", search: "%#{merged_params[:sSearch]}%")
    end
    results
  end

  def build_result
    if merged_params[:q].blank?
      results = Contrato.unscoped
    else
      results = Contrato.search(merged_params[:q]).result
    end

    results.order(sort_columns('contratos.id')).page(page).per_page(per_page)
  end
end