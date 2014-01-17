class TipoLancamento < ActiveRecord::Base
  acts_as_xlsx
  has_paper_trail class_name: 'TipoLancamentoVersion'
	include RansackableAttributes
  validates :name,
            :presence => true,
            :uniqueness => true
  attr_accessible :name, :is_refund, :is_credit, :is_invoice
end
