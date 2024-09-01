# frozen_string_literal: true

# == Schema Information
#
# Table name: orders
#
#  id          :integer          not null, primary key
#  status      :integer          not null
#  total_price :integer          default(0), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  payment_id  :integer
#  customer_id :integer
#
class Order < ApplicationRecord
  has_one :notification, dependent: :destroy
  has_one :payment, dependent: :destroy
  has_many :order_items, dependent: :destroy

  belongs_to :customer
  belongs_to :payment
end
