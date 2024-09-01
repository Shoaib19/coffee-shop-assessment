# frozen_string_literal: true

class CreatePayment < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.integer :payment_status, null: false

      t.timestamps
    end
  end
end
