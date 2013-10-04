class CreateContratos < ActiveRecord::Migration
  def change
    create_table :contratos do |t|
      t.string :name
      t.references :processo
      t.float :valor
      t.references :forma_pagamento
      t.float :saldo

      t.timestamps
    end
    add_index :contratos, :processo_id
    add_index :contratos, :forma_pagamento_id
  end
end
