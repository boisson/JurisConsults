class SituacaosDatatable < GenericDatatable
  delegate :situacao_path, :edit_situacao_path, to: :@view

protected

  def total_records
    Situacao.count
  end

  def data
    results.map do |situacao|
      [
        check_box_tag(:'ids[]', situacao.id),
        link_to(situacao.id,situacao_path(situacao), remote: true),
        input_text(situacao,situacao.name, :name),
        crud_buttons(situacao)
      ]
    end
  end

  def fetch_results
    results = build_result
      

    if merged_params[:sSearch].present?
      results = results.where("situacaos.id LIKE :search OR 
			situacaos.name LIKE :search", search: "%#{merged_params[:sSearch]}%")
    end
    results
  end

  def build_result
    if merged_params[:q].blank?
      results = Situacao.unscoped
    else
      results = Situacao.search(merged_params[:q]).result
    end

    results.order(sort_columns('situacaos.id')).page(page).per_page(per_page)
  end
end