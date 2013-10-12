class AddColumnAndamentoPrazo < ActiveRecord::Migration
  def change
    add_column :andamentos, :prazo, :integer
  end

end
