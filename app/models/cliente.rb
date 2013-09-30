class Cliente < ActiveRecord::Base
  acts_as_xlsx
  has_paper_trail class_name: 'ClienteVersion'
	attr_accessible :situacao_id, :situacao

	UNRANSACKABLE_ATTRIBUTES = %w[situacao_id situacao]
	include RansackableAttributes
  validates :name,
            :presence => true
  belongs_to :situacao
  attr_accessible :bairro, :celular, :cep, :cidade, :cnpj, :comentario, :complemento, :cpf, :estado, :fax, :logradouro, :name, :numero, :telefone
end
