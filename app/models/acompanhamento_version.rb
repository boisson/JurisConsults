class AcompanhamentoVersion < Version
  self.table_name = :acompanhamento_versions
  belongs_to :user, foreign_key: :whodunnit
end