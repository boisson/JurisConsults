class CreateAdvogadosEscritorios < ActiveRecord::Migration
  def change
    create_table :advogados_escritorios do |t|
      t.references :escritorio
      t.references :advogado

      t.timestamps
    end
    add_index :advogados_escritorios, :escritorio_id
    add_index :advogados_escritorios, :advogado_id
  end
end
