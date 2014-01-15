class ClienteVersion < PaperTrail::Version
  self.table_name = :cliente_versions
  belongs_to :user, foreign_key: :whodunnit
end
