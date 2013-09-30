class CreateProcessos < ActiveRecord::Migration
  def change
    create_table :processos do |t|
      t.string :numero
      t.string :ano
      t.date :data_inicio
      t.date :data_fim
      t.references :cliente
      t.references :reu
      t.references :advogado
      t.references :local
      t.references :tipo_processo
      t.float :custas
      t.float :honorarios

      t.timestamps
    end
    add_index :processos, :cliente_id
    add_index :processos, :reu_id
    add_index :processos, :advogado_id
    add_index :processos, :local_id
    add_index :processos, :tipo_processo_id
  end
end
