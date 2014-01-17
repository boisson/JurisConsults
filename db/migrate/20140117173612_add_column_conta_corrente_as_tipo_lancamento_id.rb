class AddColumnContaCorrenteAsTipoLancamentoId < ActiveRecord::Migration
  def up
  	    add_column :conta_correntes, :tipo_lancamento_id , :integer ,:references=>"tipo_lancamentos"
  	    add_column :conta_correntes, :forma_pagamento_id , :integer ,:references=>"forma_pagamentos"
  	    add_column :conta_correntes, :tipo_pagamento_id , :integer ,:references=>"tipo_pagamentos"
  	    add_index :conta_correntes, :tipo_lancamento_id
  	    add_index :conta_correntes, :forma_pagamento_id
  	    add_index :conta_correntes, :tipo_pagamento_id
  	                
  end

  def down
  	    remove_column :conta_correntes, :tipo_lancamento_id 
  	    remove_column :conta_correntes, :forma_pagamento_id
  	    remove_column :conta_correntes, :tipo_pagamento_id
  end
end
