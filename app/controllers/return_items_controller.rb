# frozen_string_literal: true

# return controller
class ReturnItemsController < ApplicationController
  def create
    ReturnService.new(return_params).call
    render json: {}
  end

  private

  def return_params
    params.require(:return).permit(:reason, item_ids: [])
  end
end
