# frozen_string_literal: true

class AddingReferences < ActiveRecord::Migration[7.0]
  def change
    add_column :order_items, :menu_item_id, :bigint
    add_foreign_key :order_items, :menus, column: :menu_item_id
    add_index :order_items, :menu_item_id
    add_reference :order_items, :order, foreign_key: true, index: true
    add_reference :order_items, :return, foreign_key: true, index: true

    add_reference :orders, :payment, foreign_key: true, index: true
    add_reference :orders, :customer, foreign_key: true, index: true

    add_reference :payments, :customer, foreign_key: true, index: true
    add_reference :payments, :order, foreign_key: true, index: true

    add_reference :notifications, :customer, foreign_key: true, index: true
    add_reference :notifications, :order, foreign_key: true, index: true
  end
end
