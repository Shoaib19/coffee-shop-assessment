# frozen_string_literal: true

# service to create a payment for order
class PaymentService
  def initialize(payment_attribs)
    @payment_attribs = payment_attribs
  end

  def call
    order = Order.find(payment_attribs[:order_id])
    return false unless order && order.payment_id.nil?

    payment = Payment.new(payment_status: 'pending', customer_id: order.customer_id, order_id: order.id)

    begin
      ActiveRecord::Base.transaction do
        order.customer.update!(
          card_type: payment_attribs[:card_type],
          card_number: payment_attribs[:card_number]
        )
        payment.completed!
        order.update!(payment_id: payment.id, status: 'preparing')
      end
    rescue ActiveRecord::RecordInvalid => e
      Rails.logger.error("Payment creation failed: #{e.message}")
      nil
    rescue StandardError => e
      Rails.logger.error("An unexpected error occurred: #{e.message}")
      nil
    end
    NotificationJob.set(wait: 30.seconds).perform_later(order) if payment.persisted?
    payment
  end

  private

  attr_reader :payment_attribs
end
