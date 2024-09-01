# frozen_string_literal: true

class CreateCustomer < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.integer :card_type, null: false
      t.text :card_number, null: false

      t.timestamps
    end
  end
end
