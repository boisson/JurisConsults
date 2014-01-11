class AssuntoProcessualVersion < PaperTrail::Version
  self.table_name = :assunto_processual_versions
  belongs_to :user, foreign_key: :whodunnit
end
