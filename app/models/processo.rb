class Processo < ActiveRecord::Base
  acts_as_xlsx
  has_paper_trail class_name: 'ProcessoVersion'
	attr_accessible :cliente_id, :cliente, :reu_id, :reu, :advogado_id, :advogado, :local_id, :local, :tipo_processo_id, :tipo_processo

	UNRANSACKABLE_ATTRIBUTES = %w[cliente_id cliente reu_id reu advogado_id advogado local_id local tipo_processo_id tipo_processo]
	include RansackableAttributes
  validates :numero,
            :presence => true
  validates :ano,
            :presence => true
  belongs_to :cliente
  belongs_to :reu
  belongs_to :advogado
  belongs_to :local
  belongs_to :tipo_processo
  attr_accessible :ano, :custas, :data_fim, :data_inicio, :honorarios, :numero
end
