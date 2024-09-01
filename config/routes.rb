# frozen_string_literal: true

Rails.application.routes.draw do
  get 'menu', to: 'menu#show'
  post 'orders/create', to: 'orders#create'
  post 'pay', to: 'payments#create'
  post 'return/items', to: 'return_items#create'
end
