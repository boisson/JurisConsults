class TipoAndamentoVersion < PaperTrail::Version
  self.table_name = :tipo_andamento_versions
  belongs_to :user, foreign_key: :whodunnit
end
