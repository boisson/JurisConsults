class Escritorio < ActiveRecord::Base
  acts_as_xlsx
  has_paper_trail class_name: 'EscritorioVersion'
	has_many :advogados_escritorios
	has_many :advogados, through: :advogados_escritorios
	attr_accessible :advogado_ids

	UNRANSACKABLE_ATTRIBUTES = %w[advogado_ids]
	include RansackableAttributes
  validates :name,
            :presence => true
  attr_accessible :advogados, :bairro, :cep, :cidade, :complemento, :estado, :logradouro, :name, :numero, :telefone, :fax, :celular, :quemsomos, :missao, :valores, :cnpj, :ie

  validates :name,
            :presence => true,
            :uniqueness => true
end
