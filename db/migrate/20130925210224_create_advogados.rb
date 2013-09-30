class CreateAdvogados < ActiveRecord::Migration
  def change
    create_table :advogados do |t|
      t.string :name
      t.string :cpf
      t.string :oab
      t.string :logradouro
      t.string :numero
      t.string :complemento
      t.string :bairro
      t.string :cidade
      t.string :estado
      t.string :cep
      t.text :curriculo
      t.text :comentario
      t.string :situacao
      t.string :telefone
      t.string :celular

      t.timestamps
    end
  end
end
