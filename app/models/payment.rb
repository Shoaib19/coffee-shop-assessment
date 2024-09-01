# frozen_string_literal: true

# == Schema Information
#
# Table name: payments
#
#  id          :integer          not null, primary key
#  status      :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :integer
#  order_id    :integer
#
class Payment < ApplicationRecord
  belongs_to :customer
  belongs_to :order
end
