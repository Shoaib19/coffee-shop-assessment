# frozen_string_literal: true

# == Schema Information
#
# Table name: customers
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  email       :string           not null
#  phone       :string           not null
#  card_type   :integer
#  card_number :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Customer < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :card_number, length: { minimum: 16 }, if: -> { card_number.present? }

  has_many :orders, dependent: :destroy
  has_many :payments, dependent: :destroy
  has_many :notifications, dependent: :destroy

  enum card_type: {
    debit: 0,
    credit: 1
  }
end
