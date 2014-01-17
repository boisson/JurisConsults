class TipoLancamentoVersion < PaperTrail::Version
  self.table_name = :tipo_lancamento_versions
  belongs_to :user, foreign_key: :whodunnit
end
