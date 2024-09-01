# frozen_string_literal: true

class CreateReturn < ActiveRecord::Migration[7.0]
  def change
    create_table :returns do |t|
      t.text :reason, null: false

      t.timestamps
    end
  end
end
