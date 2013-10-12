class RiscosDatatable < GenericDatatable
  delegate :risco_path, :edit_risco_path, to: :@view

protected

  def total_records
    Risco.count
  end

  def data
    results.map do |risco|
      [
        check_box_tag(:'ids[]', risco.id),
        link_to(risco.id,risco_path(risco), remote: true),
        input_text(risco,risco.name, :name),
        crud_buttons(risco)
      ]
    end
  end

  def fetch_results
    results = build_result
      

    if merged_params[:sSearch].present?
      results = results.where("riscos.id LIKE :search OR 
			riscos.name LIKE :search", search: "%#{merged_params[:sSearch]}%")
    end
    results
  end

  def build_result
    if merged_params[:q].blank?
      results = Risco.unscoped
    else
      results = Risco.search(merged_params[:q]).result
    end

    results.order(sort_columns('riscos.id')).page(page).per_page(per_page)
  end
end