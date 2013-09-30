class CreateTipoAndamentos < ActiveRecord::Migration
  def change
    create_table :tipo_andamentos do |t|
      t.string :name

      t.timestamps
    end
  end
end
