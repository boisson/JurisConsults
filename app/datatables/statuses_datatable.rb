class StatusesDatatable < GenericDatatable
  delegate :status_path, :edit_status_path, to: :@view

protected

  def total_records
    Status.count
  end

  def data
    results.map do |status|
      [
        check_box_tag(:'ids[]', status.id),
        link_to(status.id,status_path(status), remote: true),
        input_text(status,status.name, :name),
        crud_buttons(status)
      ]
    end
  end

  def fetch_results
    results = build_result
      

    if merged_params[:sSearch].present?
      results = results.where("statuses.id LIKE :search OR 
			statuses.name LIKE :search", search: "%#{merged_params[:sSearch]}%")
    end
    results
  end

  def build_result
    if merged_params[:q].blank?
      results = Status.unscoped
    else
      results = Status.search(merged_params[:q]).result
    end

    results.order(sort_columns('statuses.id')).page(page).per_page(per_page)
  end
end