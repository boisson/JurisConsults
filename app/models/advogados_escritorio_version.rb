class AdvogadosEscritorioVersion < Version
  self.table_name = :advogados_escritorio_versions
  belongs_to :user, foreign_key: :whodunnit
end