class CreateReus < ActiveRecord::Migration
  def change
    create_table :reus do |t|
      t.string :name
      t.string :cpf
      t.string :cnpj
      t.string :contato
      t.string :logradouro
      t.string :numero
      t.string :complemento
      t.string :bairro
      t.string :cidade
      t.string :estado
      t.string :cep
      t.text :comentario
      t.string :telefone
      t.string :celular
      t.string :fax

      t.timestamps
    end
  end
end
