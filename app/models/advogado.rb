class Advogado < ActiveRecord::Base
  acts_as_xlsx
  has_paper_trail class_name: 'AdvogadoVersion'
	include RansackableAttributes
  validates :name,
            :presence => true
  attr_accessible :bairro, :celular, :cep, :cidade, :comentario, :complemento, :cpf, :curriculo, :estado, :logradouro, :name, :numero, :oab, :situacao, :telefone
end
