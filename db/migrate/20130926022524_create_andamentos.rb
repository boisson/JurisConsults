class CreateAndamentos < ActiveRecord::Migration
  def change
    create_table :andamentos do |t|
      t.references :processo
      t.date :data
      t.references :tipo_andamento
      t.references :situacao
      t.text :comentario

      t.timestamps
    end
    add_index :andamentos, :processo_id
    add_index :andamentos, :tipo_andamento_id
    add_index :andamentos, :situacao_id
  end
end
