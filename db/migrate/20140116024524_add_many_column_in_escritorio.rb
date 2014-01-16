class AddManyColumnInEscritorio < ActiveRecord::Migration
  def up
    add_column :escritorios, :telefone, :string
  	add_column :escritorios, :fax, :string
  	add_column :escritorios, :celular, :string

  end

  def down
  end
end
