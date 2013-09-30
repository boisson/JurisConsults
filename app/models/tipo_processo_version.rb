class TipoProcessoVersion < Version
  self.table_name = :tipo_processo_versions
  belongs_to :user, foreign_key: :whodunnit
end