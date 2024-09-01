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
#  tax_amount   :integer          default(0), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Menu < ApplicationRecord
end
