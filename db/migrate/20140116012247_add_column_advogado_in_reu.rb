class AddColumnAdvogadoInReu < ActiveRecord::Migration
  def up
  	  add_column :reus, :advogado_id, :integer,  :references=> "advogados"
  
  end

end
