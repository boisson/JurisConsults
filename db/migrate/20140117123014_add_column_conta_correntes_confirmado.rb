class AddColumnContaCorrentesConfirmado < ActiveRecord::Migration
  def up
  	add_column :conta_correntes, :confirmado, :boolean
  end

  def down
  end
end
