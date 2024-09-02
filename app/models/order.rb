# frozen_string_literal: true

# == Schema Information
#
# Table name: orders
#
#  id          :integer          not null, primary key
#  status      :integer          not null
#  total_price :integer          default(0), not null
#  total_tax   :decimal(, )      default(0.0), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  payment_id  :integer
#  customer_id :integer
#
class Order < ApplicationRecord
  validates :status, presence: true
  validates :total_price, presence: true
  validates :total_tax, presence: true

  validate :total_price_is_valid
  # validate :total_tax_is_valid

  has_one :notification, dependent: :destroy
  has_one :payment, dependent: :destroy
  has_many :order_items, dependent: :destroy

  belongs_to :customer
  belongs_to :payment, optional: true

  accepts_nested_attributes_for :order_items

  before_create :initialize_order
  before_validation :initialize_order, on: :create

  enum status: {
    'pending': 0,
    'preparing': 1,
    'ready': 2,
    'returned': 3,
    'partially_returned': 4
  }

  delegate :id, to: :customer, prefix: true

  private

  def total_price_is_valid
    return if total_price.present? && total_price.positive? && total_price <= 100_000

    errors.add(:total_price, 'must be greater than 0 and less than or equal to 100,000')
  end

  def total_tax_is_valid
    return if total_tax.present? && total_tax >= 0.0 && total_tax <= 100.0

    errors.add(:total_tax, 'must be between 0.0 and 100.0')
  end

  def initialize_order
    self.status = 'pending'
    self.total_tax = order_items.sum { |item| (find_price_by_quantity(item) * item.menu_item_tax_amount).round }
    items_price = order_items.sum { |item| find_price_by_quantity(item) }
    self.total_price = (items_price + total_tax).round
  end

  def find_price_by_quantity(item)
    return item.menu_item_price * item.quantity if item.discount <= 0

    discounted_price = (item.menu_item_price * item.discount).round
    new_price = item.menu_item_price - discounted_price
    new_price.zero? ? 0 : new_price * item.quantity
  end
end
