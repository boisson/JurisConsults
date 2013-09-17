class StatusVersion < Version
  self.table_name = :status_versions
  belongs_to :user, foreign_key: :whodunnit
end