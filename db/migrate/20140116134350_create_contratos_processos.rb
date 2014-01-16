class CreateContratosProcessos < ActiveRecord::Migration
  def change
    create_table :contratos_processos do |t|
      t.references :contrato
      t.references :processo

      t.timestamps
    end
    add_index :contratos_processos, :contrato_id
    add_index :contratos_processos, :processo_id
  end
end
