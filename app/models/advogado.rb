class Advogado < ActiveRecord::Base
  acts_as_xlsx
  has_paper_trail class_name: 'AdvogadoVersion'
	include RansackableAttributes
  validates :name,
            :presence => true,
            length: { minimum: 2, maximum: 100 },
            uniqueness: true

  validates :cpf,
            length: { minimum: 0, maximum: 11},
            uniqueness: true

  validates :oab,
            uniqueness: true

  validates :numero,
            length: {maximum: 10}

  validates :cep,
            length: { maximum: 8}

  validates :bairro, length: {maximum: 40 }
  validates :cidade, length: {maximum: 40 }
  validates :estado, length: {maximum: 2 }

  attr_accessible :bairro, :celular, :cep, :cidade, :comentario, :complemento, :cpf, :curriculo, :estado, :logradouro, :name, :numero, :oab,:situacao,  :telefone
end
