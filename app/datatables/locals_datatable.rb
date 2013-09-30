class LocalsDatatable < GenericDatatable
  delegate :local_path, :edit_local_path, to: :@view

protected

  def total_records
    Local.count
  end

  def data
    results.map do |local|
      [
        check_box_tag(:'ids[]', local.id),
        link_to(local.id,local_path(local), remote: true),
        input_text(local,local.name, :name),
        crud_buttons(local)
      ]
    end
  end

  def fetch_results
    results = build_result
      

    if merged_params[:sSearch].present?
      results = results.where("locals.id LIKE :search OR 
			locals.name LIKE :search", search: "%#{merged_params[:sSearch]}%")
    end
    results
  end

  def build_result
    if merged_params[:q].blank?
      results = Local.unscoped
    else
      results = Local.search(merged_params[:q]).result
    end

    results.order(sort_columns('locals.id')).page(page).per_page(per_page)
  end
end