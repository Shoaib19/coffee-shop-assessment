# frozen_string_literal: true

# == Schema Information
#
# Table name: notifications
#
#  id            :integer          not null, primary key
#  notify_status :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  customer_id   :integer
#  order_id      :integer
#
class Notification < ApplicationRecord
  belongs_to :customer
  belongs_to :order

  enum notify_status: {
    'pending': 0,
    'sent': 1,
    'failed': 2
  }
end
