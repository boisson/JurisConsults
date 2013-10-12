class Processo < ActiveRecord::Base
  acts_as_xlsx
  has_paper_trail class_name: 'ProcessoVersion'
	attr_accessible :cliente_id, :cliente, :reu_id, :reu, :advogado_id, :advogado, :local_id, :local, :tipo_processo_id, :tipo_processo, :risco_id, :risco, :centro_custo_id, :centro_custo, :advogados_pc_id, :advogado_pc, :advogado, :fase_id, :fase, :local_principal_id, :local, :local_principal

	UNRANSACKABLE_ATTRIBUTES = %w[cliente_id cliente reu_id reu advogado_id advogado local_id local tipo_processo_id tipo_processo risco_id risco centro_custo_id centro_custo advogado_pc_id advogado fase_id fase local_principal_id local]
	include RansackableAttributes
  validates :numero,
            :presence => true
  validates :ano,
            :presence => true
  belongs_to :cliente
  belongs_to :reu
  belongs_to :advogado
  belongs_to :advogado_pc, class_name: 'Advogado', foreign_key: :advogados_pc_id
  belongs_to :local
  belongs_to :local_principal, class_name: 'Local'
  belongs_to :tipo_processo
  belongs_to :risco
  belongs_to :centro_custo
  belongs_to :fase
  attr_accessible :ano, :custas, :data_fim, :data_inicio, :honorarios, :numero, :numero_principal
end
