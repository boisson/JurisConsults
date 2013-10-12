class AddColumnProcesso2 < ActiveRecord::Migration
  def change
    add_column :processos, :risco_id , :integer ,:references=>"riscos"
    add_column :processos, :local_principal_id , :integer ,:references=>"locals"
    add_column :processos, :centro_custo_id , :integer ,:references=>"centro_custos"
  end

end
