class FormaPagamentosDatatable < GenericDatatable
  delegate :forma_pagamento_path, :edit_forma_pagamento_path, to: :@view

protected

  def total_records
    FormaPagamento.count
  end

  def data
    results.map do |forma_pagamento|
      [
        check_box_tag(:'ids[]', forma_pagamento.id),
        link_to(forma_pagamento.id,forma_pagamento_path(forma_pagamento), remote: true),
        input_text(forma_pagamento,forma_pagamento.name, :name),
        ((forma_pagamento.tipo_pagamento.name rescue forma_pagamento.tipo_pagamento.id) if forma_pagamento.tipo_pagamento),
        crud_buttons(forma_pagamento)
      ]
    end
  end

  def fetch_results
    results = build_result
      .joins('LEFT JOIN tipo_pagamentos ON forma_pagamentos.tipo_pagamento_id = tipo_pagamentos.id')
      

    if merged_params[:sSearch].present?
      results = results.where("forma_pagamentos.id LIKE :search OR 
			forma_pagamentos.name LIKE :search OR 
			tipo_pagamentos.id LIKE :search OR tipo_pagamentos.name LIKE :search", search: "%#{merged_params[:sSearch]}%")
    end
    results
  end

  def build_result
    if merged_params[:q].blank?
      results = FormaPagamento.unscoped
    else
      results = FormaPagamento.search(merged_params[:q]).result
    end

    results.order(sort_columns('forma_pagamentos.id')).page(page).per_page(per_page)
  end
end