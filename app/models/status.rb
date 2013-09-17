class Status < ActiveRecord::Base
  acts_as_xlsx
  has_paper_trail class_name: 'StatusVersion'
	include RansackableAttributes

  attr_accessible :name
end
