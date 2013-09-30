class EscritoriosDatatable < GenericDatatable
  delegate :escritorio_path, :edit_escritorio_path, to: :@view

protected

  def total_records
    Escritorio.count
  end

  def data
    results.map do |escritorio|
      [
        check_box_tag(:'ids[]', escritorio.id),
        link_to(escritorio.id,escritorio_path(escritorio), remote: true),
        input_text(escritorio,escritorio.name, :name),
        input_text(escritorio,escritorio.cidade, :cidade),
        input_text(escritorio,escritorio.estado, :estado),
        (escritorio.advogados.collect{|t| t.name }.sort.to_sentence rescue escritorio.advogados.collect{|t| t.id }.to_sentence),
        crud_buttons(escritorio)
      ]
    end
  end

  def fetch_results
    results = build_result
      .joins('LEFT JOIN advogados_escritorios ON escritorios.id = advogados_escritorios.escritorio_id LEFT JOIN advogados ON advogados_escritorios.advogado_id = advogados.id')
      

    if merged_params[:sSearch].present?
      results = results.where("escritorios.id LIKE :search OR 
			escritorios.name LIKE :search OR 
			escritorios.cidade LIKE :search OR
			escritorios.estado LIKE :search OR 
			advogados.name LIKE :search", search: "%#{merged_params[:sSearch]}%")
    end
    results
  end

  def build_result
    if merged_params[:q].blank?
      results = Escritorio.unscoped
    else
      results = Escritorio.search(merged_params[:q]).result
    end

    results.order(sort_columns('escritorios.id')).page(page).per_page(per_page)
  end
end