class TipoProcesso < ActiveRecord::Base
  acts_as_xlsx
  has_paper_trail class_name: 'TipoProcessoVersion'
	include RansackableAttributes
  validates :name,
            :presence => true
  attr_accessible :formato, :name
end
