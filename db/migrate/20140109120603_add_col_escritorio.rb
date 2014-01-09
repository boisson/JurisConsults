class AddColEscritorio < ActiveRecord::Migration
  def change
    add_column :escritorios, :missao , :string
    add_column :escritorios, :valores , :string
    add_column :escritorios, :quemsomos , :string
    add_column :escritorios, :cnpj , :string
    add_column :escritorios, :ie ,  :string
    add_column :escritorios, :is_pj, :boolean, default: true
  end


  def down
  	remove_column :escritorios, :missao
    remove_column :escritorios, :valores
    remove_column :escritorios, :quemsomos
    remove_column :escritorios, :cnpj
    remove_column :escritorios, :ie
    remove_column :escritorios, :is_pj
  end
end
