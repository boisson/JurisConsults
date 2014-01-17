class ContaCorrente < ActiveRecord::Base
  acts_as_xlsx
  has_paper_trail class_name: 'ContaCorrenteVersion'
	attr_accessible :contrato_id, :contrato, :confirmado, :tipo_lancamento_id, :forma_pagamento_id, :tipo_pagamento_id

	UNRANSACKABLE_ATTRIBUTES = %w[contrato_id contrato]
	include RansackableAttributes

  belongs_to :contrato
  belongs_to :tipo_lancamento
  belongs_to :forma_pagamento
  belongs_to :tipo_pagamento
  attr_accessible :date, :valor
  validates :date,
            :presence => true
  validates :valor,
            :presence => true
  validates :contrato_id,
            :presence => true
  validates :tipo_lancamento_id,
            :presence => true


end
