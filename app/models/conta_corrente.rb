class ContaCorrente < ActiveRecord::Base
  acts_as_xlsx
  has_paper_trail class_name: 'ContaCorrenteVersion'
	attr_accessible :contrato_id, :contrato

	UNRANSACKABLE_ATTRIBUTES = %w[contrato_id contrato]
	include RansackableAttributes

  belongs_to :contrato
  attr_accessible :date, :valor

  validates :date,
            :presence => true
  validates :valor,
            :presence => true
  validates :contrato_id,
            :presence => true

end
