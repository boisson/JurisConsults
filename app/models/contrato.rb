class Contrato < ActiveRecord::Base
  acts_as_xlsx
  has_paper_trail class_name: 'ContratoVersion'
  has_many :contratos_processos
	has_many :processos, through: :contratos_processos
	attr_accessible :processo_ids
	attr_accessible :forma_pagamento_id, :forma_pagamento, :dt_inicio,
                  :dt_fim, :dt_assinatura, :tipo_processo_id, :advogado_id,


	UNRANSACKABLE_ATTRIBUTES = %w[forma_pagamento_id forma_pagamento dt_inicio dt_fim dt_assinatura advogado_id advogado tipo_processo_id tipo_processo]
	include RansackableAttributes

  belongs_to :forma_pagamento
  belongs_to :tipo_processo
  attr_accessible :name, :saldo, :valor
  validates :name,
            :presence => true,
            :uniqueness => true
end
