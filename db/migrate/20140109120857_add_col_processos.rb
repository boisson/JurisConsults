class AddColProcessos < ActiveRecord::Migration
  def up
  	add_column :processos, :name, :string
  end

  def down
  	remove_column :processos, :name
  end
end
