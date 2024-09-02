# frozen_string_literal: true

# service to create a return for order items
class ReturnService
  def initialize(return_attribs)
    @return_attribs = return_attribs
    @order_items = OrderItem.where(id: return_attribs[:item_ids])
    @order = Order.find(return_attribs[:order_id])
    @payment = order.payment
  end

  def call
    return false unless order_items.all? { |item| item.return_id.nil? } && check_owner?

    return_record = Return.new(reason: return_attribs[:reason])
    begin
      ActiveRecord::Base.transaction do
        return_record.save!
        order_items.update_all(return_id: return_record.id)
        if all_items_returned?
          order.update(status: 'returned')
          payment.update(payment_status: 'refunded')
        else
          order.update(status: 'partially_returned')
          payment.update(payment_status: 'partially_refunded')
        end
      end
    rescue ActiveRecord::RecordInvalid => e
      Rails.logger.error("return creation failed: #{e.message}")
      nil
    rescue StandardError => e
      Rails.logger.error("An unexpected error occurred: #{e.message}")
      nil
    end
    return_record
  end

  private

  attr_reader :return_attribs, :order_items, :order, :payment

  def all_items_returned?
    order.order_items.size == order_items.size
  end

  def check_owner?
    order_items.all? { |item| item.order.customer == order.customer }
  end
end
