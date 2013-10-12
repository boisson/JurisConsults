class AddColumnProcesso3 < ActiveRecord::Migration
  def change
    add_column :processos, :fase_id , :integer ,:references=>"fases"
    add_column :processos, :advogados_pc_id , :integer ,:references=>"advogados"
   # add_column :processos, :local_principal_id , :integer ,:references=>"locals"
  end
end
