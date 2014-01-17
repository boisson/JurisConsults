class TipoLancamento < ActiveRecord::Migration
  def up
  	  create_table :tipo_lancamentos do |t|
      t.string :name
      t.boolean :is_credit
      t.boolean :is_refund
      t.boolean :is_confirmed 
      t.boolean :is_invoice
      t.timestamps
    end
  end

  def down
  end
end
