class Risco < ActiveRecord::Base
  acts_as_xlsx
  has_paper_trail class_name: 'RiscoVersion'
	include RansackableAttributes

  attr_accessible :name
  validates :name,
            :presence => true,
            :uniqueness => true
end
