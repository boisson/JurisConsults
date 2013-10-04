class TipoPagamento < ActiveRecord::Base
  acts_as_xlsx
  has_paper_trail class_name: 'TipoPagamentoVersion'
	include RansackableAttributes

  attr_accessible :name, :periodicidade
end
