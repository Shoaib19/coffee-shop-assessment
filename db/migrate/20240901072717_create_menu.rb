# frozen_string_literal: true

class CreateMenu < ActiveRecord::Migration[7.0]
  def change
    create_table :menus do |t|
      t.string :item_name, null: false
      t.integer :category, null: false
      t.boolean :availability, null: false, default: true
      t.integer :price, null: false
      t.text :description
      t.decimal :tax_amount, null: false, default: 0

      t.timestamps
    end
  end
end
