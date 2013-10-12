class CreateRiscos < ActiveRecord::Migration
  def change
    create_table :riscos do |t|
      t.string :name

      t.timestamps
    end
  end
end
