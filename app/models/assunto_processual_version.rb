class AssuntoProcessualVersion < Version
  self.table_name = :assunto_processual_versions
  belongs_to :user, foreign_key: :whodunnit
end