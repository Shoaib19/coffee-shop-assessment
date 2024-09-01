# frozen_string_literal: true

class CreateOrder < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :status, null: false
      t.integer :total_price, null: false, default: 0

      t.timestamps
    end
  end
end
