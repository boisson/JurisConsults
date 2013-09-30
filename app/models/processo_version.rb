class ProcessoVersion < Version
  self.table_name = :processo_versions
  belongs_to :user, foreign_key: :whodunnit
end