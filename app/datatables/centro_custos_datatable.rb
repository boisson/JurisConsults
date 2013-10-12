class CentroCustosDatatable < GenericDatatable
  delegate :centro_custo_path, :edit_centro_custo_path, to: :@view

protected

  def total_records
    CentroCusto.count
  end

  def data
    results.map do |centro_custo|
      [
        check_box_tag(:'ids[]', centro_custo.id),
        link_to(centro_custo.id,centro_custo_path(centro_custo), remote: true),
        input_text(centro_custo,centro_custo.name, :name),
        crud_buttons(centro_custo)
      ]
    end
  end

  def fetch_results
    results = build_result
      

    if merged_params[:sSearch].present?
      results = results.where("centro_custos.id LIKE :search OR 
			centro_custos.name LIKE :search", search: "%#{merged_params[:sSearch]}%")
    end
    results
  end

  def build_result
    if merged_params[:q].blank?
      results = CentroCusto.unscoped
    else
      results = CentroCusto.search(merged_params[:q]).result
    end

    results.order(sort_columns('centro_custos.id')).page(page).per_page(per_page)
  end
end