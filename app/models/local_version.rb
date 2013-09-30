class LocalVersion < Version
  self.table_name = :local_versions
  belongs_to :user, foreign_key: :whodunnit
end