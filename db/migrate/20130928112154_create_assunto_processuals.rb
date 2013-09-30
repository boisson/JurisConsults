class CreateAssuntoProcessuals < ActiveRecord::Migration
  def change
    create_table :assunto_processuals do |t|
      t.string :name

      t.timestamps
    end
  end
end
