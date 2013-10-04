class CreateContaCorrentes < ActiveRecord::Migration
  def change
    create_table :conta_correntes do |t|
      t.timestamp :date
      t.references :contrato
      t.float :valor

      t.timestamps
    end
    add_index :conta_correntes, :contrato_id
  end
end
