class TipoLancamentosDatatable < GenericDatatable
  delegate :tipo_lancamento_path, :edit_tipo_lancamento_path, to: :@view

protected

  def total_records
    TipoLancamento.count
  end

  def data
    results.map do |tipo_lancamento|
      [
        check_box_tag(:'ids[]', tipo_lancamento.id),
        link_to(tipo_lancamento.id,tipo_lancamento_path(tipo_lancamento), remote: true),
        input_text(tipo_lancamento,tipo_lancamento.name, :name),
        input_boolean(tipo_lancamento,yes_or_no(tipo_lancamento.is_refund), :is_refund),
        input_boolean(tipo_lancamento,yes_or_no(tipo_lancamento.is_invoice), :is_invoice),
        input_boolean(tipo_lancamento,yes_or_no(tipo_lancamento.is_credit), :is_credit),
        crud_buttons(tipo_lancamento)
      ]
    end
  end

  def fetch_results
    results = build_result
      

    if merged_params[:sSearch].present?
      results = results.where("tipo_lancamentos.id LIKE :search OR 
			tipo_lancamentos.name LIKE :search", search: "%#{merged_params[:sSearch]}%")
    end
    results
  end

  def build_result
    if merged_params[:q].blank?
      results = TipoLancamento.unscoped
    else
      results = TipoLancamento.search(merged_params[:q]).result
    end

    results.order(sort_columns('tipo_lancamentos.id')).page(page).per_page(per_page)
  end
end