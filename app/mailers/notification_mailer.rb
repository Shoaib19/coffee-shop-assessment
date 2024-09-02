# frozen_string_literal: true

# notification mailer
class NotificationMailer < ApplicationMailer
  default from: 'no-reply@yourcoffeeshop.com'

  def notify_customer_email(order)
    @customer_name = order.customer.name
    @order_id = order.id
    mail(
      to: order.customer.email,
      subject: 'Your Order is Ready for Pickup!',
      template_name: 'notify_customer_email'
    )
  end
end
