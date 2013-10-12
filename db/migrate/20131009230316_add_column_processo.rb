class AddColumnProcesso < ActiveRecord::Migration
  def change
    add_column :processos, :numero_principal, :string
    add_column :processos, :distribuicao, :date
  end
end
