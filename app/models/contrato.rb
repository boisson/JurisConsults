class Contrato < ActiveRecord::Base
  acts_as_xlsx
  has_paper_trail class_name: 'ContratoVersion'
	attr_accessible :processo_id, :processo, :forma_pagamento_id, :forma_pagamento, :dt_inicio,
                  :dt_fim, :dt_assinatura,


	UNRANSACKABLE_ATTRIBUTES = %w[processo_id processo forma_pagamento_id forma_pagamento dt_inicio dt_fim dt_assinatura tipo_processo_id tipo_processo]
	include RansackableAttributes

  belongs_to :processo
  belongs_to :forma_pagamento
  belongs_to :tipo_processo
  attr_accessible :name, :saldo, :valor
  validates :name,
            :presence => true,
            :uniqueness => true
end
