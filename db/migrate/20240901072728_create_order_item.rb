# frozen_string_literal: true

class CreateOrderItem < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.integer :quantity, null: false, default: 1
      t.decimal :discount, precision: 5, scale: 2, default: 0.00

      t.timestamps
    end
  end
end
