# frozen_string_literal: true

# == Schema Information
#
# Table name: order_items
#
#  id           :integer          not null, primary key
#  quantity     :integer          default(1), not null
#  discount     :decimal(5, 2)    default(0.0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  menu_item_id :integer
#  order_id     :integer
#  return_id    :integer
#
class OrderItem < ApplicationRecord
  belongs_to :menu_item, class_name: 'Menu', foreign_key: :menu_item_id
  belongs_to :order
  belogns_to :return, optional: true
end
