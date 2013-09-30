class CreateEscritorios < ActiveRecord::Migration
  def change
    create_table :escritorios do |t|
      t.string :name
      t.string :logradouro
      t.string :numero
      t.string :complemento
      t.string :bairro
      t.string :cep
      t.string :cidade
      t.string :estado
      t.n_to_n_2_columns :advogados

      t.timestamps
    end
  end
end
