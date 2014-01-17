class RemoveColumnTipoLancamentosIsConfirmed < ActiveRecord::Migration
  def up
  	  remove_column :tipo_lancamentos, :is_confirmed
  end
  def down
  end
end
