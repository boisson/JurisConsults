class EscritorioVersion < PaperTrail::Version
  self.table_name = :escritorio_versions
  belongs_to :user, foreign_key: :whodunnit
end
