class FormaPagamento < ActiveRecord::Base
  acts_as_xlsx
  has_paper_trail class_name: 'FormaPagamentoVersion'
	attr_accessible :tipo_pagamento_id, :tipo_pagamento

	UNRANSACKABLE_ATTRIBUTES = %w[tipo_pagamento_id tipo_pagamento]
	include RansackableAttributes

  belongs_to :tipo_pagamento
  attr_accessible :name
  validates :name,
            :presence => true,
            :uniqueness => true
end
