class Situacao < ActiveRecord::Base
  acts_as_xlsx
  has_paper_trail class_name: 'SituacaoVersion'
	include RansackableAttributes
  validates :name,
            :presence => true
  attr_accessible :name
end
