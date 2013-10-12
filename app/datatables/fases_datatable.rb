class FasesDatatable < GenericDatatable
  delegate :fase_path, :edit_fase_path, to: :@view

protected

  def total_records
    Fase.count
  end

  def data
    results.map do |fase|
      [
        check_box_tag(:'ids[]', fase.id),
        link_to(fase.id,fase_path(fase), remote: true),
        input_text(fase,fase.name, :name),
        crud_buttons(fase)
      ]
    end
  end

  def fetch_results
    results = build_result
      

    if merged_params[:sSearch].present?
      results = results.where("fases.id LIKE :search OR 
			fases.name LIKE :search", search: "%#{merged_params[:sSearch]}%")
    end
    results
  end

  def build_result
    if merged_params[:q].blank?
      results = Fase.unscoped
    else
      results = Fase.search(merged_params[:q]).result
    end

    results.order(sort_columns('fases.id')).page(page).per_page(per_page)
  end
end