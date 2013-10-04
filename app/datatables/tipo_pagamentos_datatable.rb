class TipoPagamentosDatatable < GenericDatatable
  delegate :tipo_pagamento_path, :edit_tipo_pagamento_path, to: :@view

protected

  def total_records
    TipoPagamento.count
  end

  def data
    results.map do |tipo_pagamento|
      [
        check_box_tag(:'ids[]', tipo_pagamento.id),
        link_to(tipo_pagamento.id,tipo_pagamento_path(tipo_pagamento), remote: true),
        input_text(tipo_pagamento,tipo_pagamento.name, :name),
        input_text(tipo_pagamento,tipo_pagamento.periodicidade, :periodicidade),
        crud_buttons(tipo_pagamento)
      ]
    end
  end

  def fetch_results
    results = build_result
      

    if merged_params[:sSearch].present?
      results = results.where("tipo_pagamentos.id LIKE :search OR 
			tipo_pagamentos.name LIKE :search OR 
			tipo_pagamentos.periodicidade LIKE :search", search: "%#{merged_params[:sSearch]}%")
    end
    results
  end

  def build_result
    if merged_params[:q].blank?
      results = TipoPagamento.unscoped
    else
      results = TipoPagamento.search(merged_params[:q]).result
    end

    results.order(sort_columns('tipo_pagamentos.id')).page(page).per_page(per_page)
  end
end