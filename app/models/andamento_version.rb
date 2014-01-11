class AndamentoVersion < PaperTrail::Version
  self.table_name = :andamento_versions
  belongs_to :user, foreign_key: :whodunnit
end
