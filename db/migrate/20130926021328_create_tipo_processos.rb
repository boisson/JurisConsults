class CreateTipoProcessos < ActiveRecord::Migration
  def change
    create_table :tipo_processos do |t|
      t.string :name
      t.string :formato

      t.timestamps
    end
  end
end
