class DeleteContratoColProcesso < ActiveRecord::Migration
  def up
  	    remove_column :contratos, :processo_id

  end

  def down
  end
end
