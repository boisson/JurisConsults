class TipoProcessosDatatable < GenericDatatable
  delegate :tipo_processo_path, :edit_tipo_processo_path, to: :@view

protected

  def total_records
    TipoProcesso.count
  end

  def data
    results.map do |tipo_processo|
      [
        check_box_tag(:'ids[]', tipo_processo.id),
        link_to(tipo_processo.id,tipo_processo_path(tipo_processo), remote: true),
        input_text(tipo_processo,tipo_processo.name, :name),
        input_text(tipo_processo,tipo_processo.formato, :formato),
        crud_buttons(tipo_processo)
      ]
    end
  end

  def fetch_results
    results = build_result
      

    if merged_params[:sSearch].present?
      results = results.where("tipo_processos.id LIKE :search OR 
			tipo_processos.name LIKE :search OR 
			tipo_processos.formato LIKE :search", search: "%#{merged_params[:sSearch]}%")
    end
    results
  end

  def build_result
    if merged_params[:q].blank?
      results = TipoProcesso.unscoped
    else
      results = TipoProcesso.search(merged_params[:q]).result
    end

    results.order(sort_columns('tipo_processos.id')).page(page).per_page(per_page)
  end
end