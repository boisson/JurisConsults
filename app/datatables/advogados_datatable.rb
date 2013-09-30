class AdvogadosDatatable < GenericDatatable
  delegate :advogado_path, :edit_advogado_path, to: :@view

protected

  def total_records
    Advogado.count
  end

  def data
    results.map do |advogado|
      [
        check_box_tag(:'ids[]', advogado.id),
        link_to(advogado.id,advogado_path(advogado), remote: true),
        input_text(advogado,advogado.name, :name),
        input_text(advogado,advogado.oab, :oab),
        input_text(advogado,advogado.cidade, :cidade),
        input_text(advogado,advogado.estado, :estado),
        input_text(advogado,advogado.situacao, :situacao),
        input_text(advogado,advogado.telefone, :telefone),
        input_text(advogado,advogado.celular, :celular),
        crud_buttons(advogado)
      ]
    end
  end

  def fetch_results
    results = build_result
      

    if merged_params[:sSearch].present?
      results = results.where("advogados.id LIKE :search OR 
			advogados.name LIKE :search OR 
			advogados.cpf LIKE :search OR 
			advogados.oab LIKE :search OR 
			advogados.logradouro LIKE :search OR 
			advogados.numero LIKE :search OR 
			advogados.complemento LIKE :search OR 
			advogados.bairro LIKE :search OR 
			advogados.cidade LIKE :search OR 
			advogados.estado LIKE :search OR 
			advogados.cep LIKE :search OR 
			advogados.curriculo LIKE :search OR 
			advogados.comentario LIKE :search OR 
			advogados.situacao LIKE :search OR 
			advogados.telefone LIKE :search OR 
			advogados.celular LIKE :search", search: "%#{merged_params[:sSearch]}%")
    end
    results
  end

  def build_result
    if merged_params[:q].blank?
      results = Advogado.unscoped
    else
      results = Advogado.search(merged_params[:q]).result
    end

    results.order(sort_columns('advogados.id')).page(page).per_page(per_page)
  end
end