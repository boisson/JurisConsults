class Contrato < ActiveRecord::Base
  acts_as_xlsx
  has_paper_trail class_name: 'ContratoVersion'
	attr_accessible :processo_id, :processo, :forma_pagamento_id, :forma_pagamento

	UNRANSACKABLE_ATTRIBUTES = %w[processo_id processo forma_pagamento_id forma_pagamento]
	include RansackableAttributes

  belongs_to :processo
  belongs_to :forma_pagamento
  attr_accessible :name, :saldo, :valor
end