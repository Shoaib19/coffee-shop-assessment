# frozen_string_literal: true

# == Schema Information
#
# Table name: payments
#
#  id             :integer          not null, primary key
#  payment_status :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  customer_id    :integer
#  order_id       :integer
#
class Payment < ApplicationRecord
  belongs_to :customer
  belongs_to :order

  enum payment_status: {
    'pending': 0,
    'completed': 1,
    'failed': 2,
    'refunded': 3,
    'partially_refunded': 4
  }

  delegate :order_items, to: :order
end
