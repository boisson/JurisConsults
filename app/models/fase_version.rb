class FaseVersion < Version
  self.table_name = :fase_versions
  belongs_to :user, foreign_key: :whodunnit
end