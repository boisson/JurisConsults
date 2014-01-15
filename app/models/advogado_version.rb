class AdvogadoVersion < PaperTrail::Version
  self.table_name = :advogado_versions
  belongs_to :user, foreign_key: :whodunnit
end
