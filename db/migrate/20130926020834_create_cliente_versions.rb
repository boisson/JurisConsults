class CreateClienteVersions < ActiveRecord::Migration
  def self.up
    create_table :cliente_versions do |t|
      t.string   :item_type, :null => false
      t.integer  :item_id,   :null => false
      t.string   :event,     :null => false
      t.string   :whodunnit
      t.text     :object
      t.text     :object_changes
      t.datetime :created_at
    end
    add_index :cliente_versions, [:item_type, :item_id]
  end

  def self.down
    remove_index :cliente_versions, [:item_type, :item_id]
    drop_table :cliente_versions
  end
end