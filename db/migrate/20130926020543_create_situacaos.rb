class CreateSituacaos < ActiveRecord::Migration
  def change
    create_table :situacaos do |t|
      t.string :name

      t.timestamps
    end
  end
end
