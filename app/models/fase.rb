class Fase < ActiveRecord::Base
  acts_as_xlsx
  has_paper_trail class_name: 'FaseVersion'
	include RansackableAttributes

  attr_accessible :name
  validates :name,
            :presence => true,
            :uniqueness => true
end
