class CreateCentroCustos < ActiveRecord::Migration
  def change
    create_table :centro_custos do |t|
      t.string :name

      t.timestamps
    end
  end
end
