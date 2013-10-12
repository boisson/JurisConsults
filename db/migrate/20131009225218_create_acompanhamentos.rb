class CreateAcompanhamentos < ActiveRecord::Migration
  def change
    create_table :acompanhamentos do |t|
      t.references :contratos
      t.date :data
      t.time :hora
      t.string :name

      t.timestamps
    end
    add_index :acompanhamentos, :contratos_id
  end
end
