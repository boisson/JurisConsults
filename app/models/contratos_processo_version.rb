class ContratosProcessoVersion < PaperTrail::Version
  self.table_name = :contratos_processo_versions
  belongs_to :user, foreign_key: :whodunnit
end
