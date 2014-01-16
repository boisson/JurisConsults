class ContratosProcesso < ActiveRecord::Base
  acts_as_xlsx
  has_paper_trail class_name: 'ContratosProcessoVersion'
	attr_accessible :contrato_id, :contrato, :processo_id, :processo

	UNRANSACKABLE_ATTRIBUTES = %w[contrato_id contrato processo_id processo]
	include RansackableAttributes

  belongs_to :contrato
  belongs_to :processo
  # attr_accessible :title, :body
end

