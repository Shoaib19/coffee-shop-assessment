# frozen_string_literal: true

# == Schema Information
#
# Table name: customers
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  email       :string           not null
#  phone       :string           not null
#  card_type   :integer          not null
#  card_number :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Customer < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :payments, dependent: :destroy
  has_many :notifications, dependent: :destroy
end
