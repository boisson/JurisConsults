class CreateTipoPagamentos < ActiveRecord::Migration
  def change
    create_table :tipo_pagamentos do |t|
      t.string :name
      t.integer :periodicidade

      t.timestamps
    end
  end
end
