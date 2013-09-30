class Andamento < ActiveRecord::Base
  acts_as_xlsx
  has_paper_trail class_name: 'AndamentoVersion'
	attr_accessible :processo_id, :processo, :tipo_andamento_id, :tipo_andamento, :situacao_id, :situacao

	UNRANSACKABLE_ATTRIBUTES = %w[processo_id processo tipo_andamento_id tipo_andamento situacao_id situacao]
	include RansackableAttributes

  belongs_to :processo
  belongs_to :tipo_andamento
  belongs_to :situacao
  attr_accessible :comentario, :data
  validates :comentario, :data, :processo, :tipo_andamento,
            :presence => true

end
