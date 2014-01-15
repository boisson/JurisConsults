class ContaCorrenteVersion < PaperTrail::Version
  self.table_name = :conta_corrente_versions
  belongs_to :user, foreign_key: :whodunnit
end
