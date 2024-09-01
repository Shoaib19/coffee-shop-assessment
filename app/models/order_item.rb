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
  validates :quantity, presence: true, numericality: { greater_than: 0 }

  belongs_to :menu_item, class_name: 'Menu', foreign_key: :menu_item_id
  belongs_to :order
  belongs_to :return, optional: true

  delegate :price, :tax_amount, to: :menu_item, prefix: true

  def item_name
    menu_item.item_name
  end
end
