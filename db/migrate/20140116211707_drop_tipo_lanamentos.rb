class DropTipoLanamentos < ActiveRecord::Migration
  def up
  	drop_table :tipo_lancamentos
  end

  def down
  end
end
