# frozen_string_literal: true

# == Schema Information
#
# Table name: returns
#
#  id         :integer          not null, primary key
#  reason     :text             not null
#  status     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Return < ApplicationRecord
  has_many :order_item, dependent: :destroy
end
