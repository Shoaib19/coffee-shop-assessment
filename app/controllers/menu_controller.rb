# frozen_string_literal: true

# menu controller
class MenuController < ApplicationController
  def show
    items = Menu.all

    heading = '**** Dear Customer please choose the items from the Menu ****'
    instructions = '**** to create order hit the api POST /orders/create see the README for payload ****'

    render json: { heading:, instructions:, items: }
  end
end
