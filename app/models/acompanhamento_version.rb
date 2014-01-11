class AcompanhamentoVersion < PaperTrail::Version
  self.table_name = :acompanhamento_versions
  belongs_to :user, foreign_key: :whodunnit
end
