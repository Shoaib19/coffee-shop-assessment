# frozen_string_literal: true

# payment controller
class PaymentsController < ApplicationController
  def create
    payment = PaymentService.new(payment_params).call
    response = if payment
                 list = create_order_item_list(payment)
                 'Thank you for your payment, it has been processed successfully.' \
                 " Your order has been sent to the kitchen, and we'll notify you as soon as it's ready." \
                 'there are the list of items {id, name} you can use ids if you want to return items' \
                 "#{list}" \
                 ' using the api POST return/items see README for payload info'
               else
                 'Please make sure you pass a valid order id, card number and a valid card type' \
                 't’s possible that the payment has already been made.'
               end

    render json: { response: }
  end

  private

  def create_order_item_list(payment)
    list = []
    payment.order_items.each do |order_item|
      list.push(
        {
          id: order_item.id,
          name: order_item.item_name
        }
      )
    end
    list
  end

  def payment_params
    params.require(:payment).permit(:order_id, :card_number, :card_type)
  end
end
