class Acompanhamento < ActiveRecord::Base
  acts_as_xlsx
  has_paper_trail class_name: 'AcompanhamentoVersion'
	attr_accessible :contratos_id, :contratos

	UNRANSACKABLE_ATTRIBUTES = %w[contratos_id contratos]
	include RansackableAttributes

  belongs_to :contratos
  attr_accessible :data, :hora, :name
end
