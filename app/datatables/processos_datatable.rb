class ProcessosDatatable < GenericDatatable
  delegate :processo_path, :edit_processo_path, to: :@view

protected

  def total_records
    Processo.count
  end

  def data
    results.map do |processo|
      [
        check_box_tag(:'ids[]', processo.id),
        link_to(processo.id,processo_path(processo), remote: true),
        input_text(processo,processo.numero, :numero),
        input_text(processo,processo.ano, :ano),
        input_date(processo,(l(processo.data_inicio) rescue nil), :data_inicio),
        input_date(processo,(l(processo.data_fim) rescue nil), :data_fim),
        ((processo.cliente.name rescue processo.cliente.id) if processo.cliente),
        ((processo.reu.name rescue processo.reu.id) if processo.reu),
        ((processo.advogado.name rescue processo.advogado.id) if processo.advogado),
        ((processo.local.name rescue processo.local.id) if processo.local),
        ((processo.tipo_processo.name rescue processo.tipo_processo.id) if processo.tipo_processo),
         crud_buttons(processo)
      ]
    end
  end

  def fetch_results
    results = build_result
      .joins('LEFT JOIN clientes ON processos.cliente_id = clientes.id')
      .joins('LEFT JOIN reus ON processos.reu_id = reus.id')
      .joins('LEFT JOIN advogados ON processos.advogado_id = advogados.id')
      .joins('LEFT JOIN locals ON processos.local_id = locals.id')
      .joins('LEFT JOIN tipo_processos ON processos.tipo_processo_id = tipo_processos.id')
      

    if merged_params[:sSearch].present?
      results = results.where("processos.id LIKE :search OR 
			processos.numero LIKE :search OR 
			processos.ano LIKE :search OR 
			processos.data_inicio LIKE :search OR 
			processos.data_fim LIKE :search OR 
			clientes.id LIKE :search OR clientes.name LIKE :search OR 
			reus.id LIKE :search OR reus.name LIKE :search OR 
			advogados.id LIKE :search OR advogados.name LIKE :search OR 
			locals.id LIKE :search OR locals.name LIKE :search OR 
			tipo_processos.id LIKE :search OR tipo_processos.name LIKE :search", search: "%#{merged_params[:sSearch]}%")
    end
    results
  end

  def build_result
    if merged_params[:q].blank?
      results = Processo.unscoped
    else
      results = Processo.search(merged_params[:q]).result
    end

    results.order(sort_columns('processos.id')).page(page).per_page(per_page)
  end
end