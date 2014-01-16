class ReusDatatable < GenericDatatable
  delegate :reu_path, :edit_reu_path, to: :@view

protected

  def total_records
    Reu.count
  end

  def data
    results.map do |reu|
      [
        check_box_tag(:'ids[]', reu.id),
        link_to(reu.id,reu_path(reu), remote: true),
        input_text(reu,reu.name, :name),
        input_text(reu,reu.contato, :contato),
        input_text(reu,reu.telefone, :telefone),
        input_text(reu,reu.celular, :celular),
        input_text(reu,reu.fax, :fax),
        crud_buttons(reu)
      ]
    end
  end

  def fetch_results
    results = build_result
      

    if merged_params[:sSearch].present?
      results = results.where("reus.id LIKE :search OR 
			reus.name LIKE :search OR 
			reus.cpf LIKE :search OR 
			reus.cnpj LIKE :search OR 
			reus.contato LIKE :search OR 
			reus.logradouro LIKE :search OR 
			reus.numero LIKE :search OR 
			reus.complemento LIKE :search OR 
			reus.bairro LIKE :search OR 
			reus.cidade LIKE :search OR 
			reus.estado LIKE :search OR 
			reus.cep LIKE :search OR 
			reus.comentario LIKE :search OR 
			reus.telefone LIKE :search OR 
			reus.celular LIKE :search OR 
			reus.fax LIKE :search", search: "%#{merged_params[:sSearch]}%")
    end
    results
  end

  def build_result
    if merged_params[:q].blank?
      results = Reu.unscoped
    else
      results = Reu.search(merged_params[:q]).result
    end

    results.order(sort_columns('reus.id')).page(page).per_page(per_page)
  end
end