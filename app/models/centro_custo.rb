class CentroCusto < ActiveRecord::Base
  acts_as_xlsx
  has_paper_trail class_name: 'CentroCustoVersion'
	include RansackableAttributes

  attr_accessible :name
  validates :name,
            :presence => true,
            :uniqueness => true
end
