# frozen_string_literal: true

# order controller
class OrdersController < ApplicationController
  def create
    customer = CustomerService.new(order_params[:customer]).call
    order = OrderService.new(order_params[:items], customer.id).create

    response = "Thank you for placing your order, #{customer.name}. Your order ID is #{order.id}," \
               " and the total amount is $ #{order.total_price}. To complete your payment, " \
               ' please send a POST request to the /pay API endpoint. ' \
               ' Refer to the README for details on the payload.'
    render json: { response: }
  end

  private

  def order_params
    params.require(:order).permit(
      customer: %i[name email phone],
      items: %i[name quantity]
    )
  end
end
