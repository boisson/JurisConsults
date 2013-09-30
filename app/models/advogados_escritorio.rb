class AdvogadosEscritorio < ActiveRecord::Base
  acts_as_xlsx
  has_paper_trail class_name: 'AdvogadosEscritorioVersion'
	attr_accessible :escritorio_id, :escritorio, :advogado_id, :advogado

	UNRANSACKABLE_ATTRIBUTES = %w[escritorio_id escritorio advogado_id advogado]
	include RansackableAttributes

  belongs_to :escritorio
  belongs_to :advogado
  # attr_accessible :title, :body
end
