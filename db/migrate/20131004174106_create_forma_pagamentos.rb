class CreateFormaPagamentos < ActiveRecord::Migration
  def change
    create_table :forma_pagamentos do |t|
      t.string :name
      t.references :tipo_pagamento

      t.timestamps
    end
    add_index :forma_pagamentos, :tipo_pagamento_id
  end
end
