# frozen_string_literal: true

# background job to send notifications and update order status
class NotificationJob < ApplicationJob
  queue_as :default

  def perform(order)
    # for now I am just updating the order status can't send the email to dummy customers
    # but here we can send the email to customers to notify them.
    order.ready!
    notification = Notification.new(notify_status: 'sent',
                                    customer_id: order.customer_id,
                                    order_id: order.id)
    notification.save!
    # NotificationMailer.notify_customer_email(order).deliver_now
  end
end
