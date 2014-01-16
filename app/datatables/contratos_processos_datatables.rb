class ContratosProcessosDatatable < GenericDatatable
  delegate :contratos_processo_path, :edit_contratos_processo_path, to: :@view

protected

  def total_records
    ContratosProcesso.count
  end

  def data
    results.map do |contratos_processo|
      [
        check_box_tag(:'ids[]', contratos_processo.id),
        link_to(contratos_processo.id,contratos_processo_path(contratos_processo), remote: true),
        ((contratos_processo.contrato.name rescue contratos_processo.contrato.id) if contratos_processo.contrato),
        ((contratos_processo.processo.name rescue contratos_processo.processo.id) if contratos_processo.processo),
        crud_buttons(contratos_processo)
      ]
    end
  end

  def fetch_results
    results = build_result
      .joins('LEFT JOIN contratos ON contratos_processos.contrato_id = contratos.id')
      .joins('LEFT JOIN processos ON contratos_processos.processo_id = processos.id')
      

    if merged_params[:sSearch].present?
      results = results.where("contratos_processos.id LIKE :search OR 
			contratos.id LIKE :search OR contratos.name LIKE :search OR 
			processos.id LIKE :search OR processos.name LIKE :search", search: "%#{merged_params[:sSearch]}%")
    end
    results
  end

  def build_result
    if merged_params[:q].blank?
      results = ContratosProcesso.unscoped
    else
      results = ContratosProcesso.search(merged_params[:q]).result
    end

    results.order(sort_columns('contratos_processos.id')).page(page).per_page(per_page)
  end
end