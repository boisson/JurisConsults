class TipoPagamentoVersion < Version
  self.table_name = :tipo_pagamento_versions
  belongs_to :user, foreign_key: :whodunnit
end