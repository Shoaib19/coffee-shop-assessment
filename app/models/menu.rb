# frozen_string_literal: true

# == Schema Information
#
# Table name: menus
#
#  id           :integer          not null, primary key
#  item_name    :string           not null
#  category     :integer          not null
#  availability :boolean          default(TRUE), not null
#  price        :integer          not null
#  description  :text
#  tax_amount   :decimal(, )      default(0.0), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Menu < ApplicationRecord
  validates :item_name, presence: true
  validates :category, presence: true
  validates :availability, presence: true
  validates :price, presence: true

  validate :price_is_valid
  validate :tax_is_valid

  enum category: {
    'coffee': 0,
    'tea': 1,
    'cold_beverages': 2,
    'sandwiches': 3
  }

  def price_is_valid
    return if price.present? && price.positive? && price <= 10_000

    errors.add(:price, 'must be greater than 0 and less than or equal to 10,000')
  end

  def tax_is_valid
    return if tax_amount.present? && tax_amount >= 0.0 && tax_amount <= 100.0

    errors.add(:tax_amount, 'must be between 0.0 and 100.0')
  end
end
