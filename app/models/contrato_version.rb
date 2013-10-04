class ContratoVersion < Version
  self.table_name = :contrato_versions
  belongs_to :user, foreign_key: :whodunnit
end