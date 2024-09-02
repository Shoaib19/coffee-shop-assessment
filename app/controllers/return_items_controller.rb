# frozen_string_literal: true

# return controller
class ReturnItemsController < ApplicationController
  def create
    response = ReturnService.new(return_params).call
    message = if response
                'We apologize for the inconvenience. Your item has been returned,' \
                ' and a refund has been issued. '
              else
                'One or more items have already been returned.' \
                ' Please try again with item IDs that have not been returned.'\
                ' Additionally, all items should have been purchased by you;'\
                ' do not return items that you do not own.'

              end
    render json: { message: }
  end

  private

  def return_params
    params.require(:return).permit(:reason, :order_id, item_ids: [])
  end
end
