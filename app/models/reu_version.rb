class ReuVersion < PaperTrail::Version
  self.table_name = :reu_versions
  belongs_to :user, foreign_key: :whodunnit
end
