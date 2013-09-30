class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :name
      t.string :cpf
      t.string :cnpj
      t.references :situacao
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
    add_index :clientes, :situacao_id
  end
end
