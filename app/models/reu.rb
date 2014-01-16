class Reu < ActiveRecord::Base
  acts_as_xlsx
  has_paper_trail class_name: 'ReuVersion'

	include RansackableAttributes
  validates :name,
            :presence => true,
            :uniqueness => true
  belongs_to :advogado

  attr_accessible :advogado_id, :advogado
  attr_accessible :bairro, :celular, :cep, :cidade, :cnpj, :comentario, :complemento, :contato, :cpf, :estado, :fax, :logradouro, :name, :numero, :telefone
end
