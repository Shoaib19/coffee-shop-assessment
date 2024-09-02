# frozen_string_literal: true

# service to create a new order
class OrderService
  def initialize(item_attribs, customer_id)
    @item_attribs = item_attribs
    @customer_id = customer_id
    @order_items = []
    @item_names = item_attribs.pluck(:name)
  end

  def create
    prepare_order_item_hash(item_attribs)
    apply_discount
    apply_free_items
    order = Order.new({ customer_id:, order_items_attributes: order_items })
    begin
      order.save!
      order
    rescue ActiveRecord::RecordInvalid => e
      Rails.logger.error("Order creation failed: #{e.message}")
      nil
    rescue StandardError => e
      Rails.logger.error("An unexpected error occurred: #{e.message}")
      nil
    end
  end

  private

  attr_reader :item_attribs, :customer_id, :order_items, :item_names

  def prepare_order_item_hash(item_attribs)
    item_attribs.each do |item_hash|
      order_items.push(
        {
          quantity: item_hash[:quantity],
          discount: 0.0,
          menu_item_id: fetch_item_id(item_hash[:name])
        }
      )
    end
  end

  def apply_discount
    return unless discount_items_included?('Veggie Wrap', 'Lemonade')

    order_items.each do |item|
      item[:discount] = 0.5 if item[:menu_item_id] == 14 || item[:menu_item_id] == 10
    end
  end

  def apply_free_items
    return unless discount_items_included?('Turkey Club Sandwich', 'Iced Coffee')

    order_items.each do |item|
      item[:discount] = 1 if item[:menu_item_id] == 8 && item[:quantity] <= 3
    end
  end

  def discount_items_included?(item1, item2)
    item_names.include?(item1) && item_names.include?(item2)
  end

  def fetch_item_id(item_name)
    Menu.where('LOWER(item_name) LIKE ?', item_name.strip.downcase).first.id
  end
end
