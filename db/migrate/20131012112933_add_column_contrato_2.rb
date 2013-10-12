class AddColumnContrato2 < ActiveRecord::Migration
  def change
    add_column :contratos, :dt_fim , :date
    add_column :contratos, :dt_assinatura , :date
    add_column :contratos, :dt_inicio , :date
    add_column :contratos, :tipo_processo_id, :integer,  :references=> "tipo_processos"
  end

end
