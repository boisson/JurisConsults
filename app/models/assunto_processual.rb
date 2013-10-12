class AssuntoProcessual < ActiveRecord::Base
  acts_as_xlsx
  has_paper_trail class_name: 'AssuntoProcessualVersion'
	include RansackableAttributes
  validates :name,
            :presence => true,
            :uniqueness => true
  attr_accessible :name
end
