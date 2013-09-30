class SituacaoVersion < Version
  self.table_name = :situacao_versions
  belongs_to :user, foreign_key: :whodunnit
end