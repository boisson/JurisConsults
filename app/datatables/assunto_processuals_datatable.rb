class AssuntoProcessualsDatatable < GenericDatatable
  delegate :assunto_processual_path, :edit_assunto_processual_path, to: :@view

protected

  def total_records
    AssuntoProcessual.count
  end

  def data
    results.map do |assunto_processual|
      [
        check_box_tag(:'ids[]', assunto_processual.id),
        link_to(assunto_processual.id,assunto_processual_path(assunto_processual), remote: true),
        input_text(assunto_processual,assunto_processual.name, :name),
        crud_buttons(assunto_processual)
      ]
    end
  end

  def fetch_results
    results = build_result
      

    if merged_params[:sSearch].present?
      results = results.where("assunto_processuals.id LIKE :search OR 
			assunto_processuals.name LIKE :search", search: "%#{merged_params[:sSearch]}%")
    end
    results
  end

  def build_result
    if merged_params[:q].blank?
      results = AssuntoProcessual.unscoped
    else
      results = AssuntoProcessual.search(merged_params[:q]).result
    end

    results.order(sort_columns('assunto_processuals.id')).page(page).per_page(per_page)
  end
end