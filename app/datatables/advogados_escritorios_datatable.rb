class AdvogadosEscritoriosDatatable < GenericDatatable
  delegate :advogados_escritorio_path, :edit_advogados_escritorio_path, to: :@view

protected

  def total_records
    AdvogadosEscritorio.count
  end

  def data
    results.map do |advogados_escritorio|
      [
        check_box_tag(:'ids[]', advogados_escritorio.id),
        link_to(advogados_escritorio.id,advogados_escritorio_path(advogados_escritorio), remote: true),
        ((advogados_escritorio.escritorio.name rescue advogados_escritorio.escritorio.id) if advogados_escritorio.escritorio),
        ((advogados_escritorio.advogado.name rescue advogados_escritorio.advogado.id) if advogados_escritorio.advogado),
        crud_buttons(advogados_escritorio)
      ]
    end
  end

  def fetch_results
    results = build_result
      .joins('LEFT JOIN escritorios ON advogados_escritorios.escritorio_id = escritorios.id')
      .joins('LEFT JOIN advogados ON advogados_escritorios.advogado_id = advogados.id')
      

    if merged_params[:sSearch].present?
      results = results.where("advogados_escritorios.id LIKE :search OR 
			escritorios.id LIKE :search OR escritorios.name LIKE :search OR 
			advogados.id LIKE :search OR advogados.name LIKE :search", search: "%#{merged_params[:sSearch]}%")
    end
    results
  end

  def build_result
    if merged_params[:q].blank?
      results = AdvogadosEscritorio.unscoped
    else
      results = AdvogadosEscritorio.search(merged_params[:q]).result
    end

    results.order(sort_columns('advogados_escritorios.id')).page(page).per_page(per_page)
  end
end