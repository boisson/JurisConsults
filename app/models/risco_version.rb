class RiscoVersion < Version
  self.table_name = :risco_versions
  belongs_to :user, foreign_key: :whodunnit
end