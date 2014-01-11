class FormaPagamentoVersion < PaperTrail::Version
  self.table_name = :forma_pagamento_versions
  belongs_to :user, foreign_key: :whodunnit
end
