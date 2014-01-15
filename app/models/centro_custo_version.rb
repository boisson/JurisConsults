class CentroCustoVersion < PaperTrail::Version
  self.table_name = :centro_custo_versions
  belongs_to :user, foreign_key: :whodunnit
end
