class OrdersController < ApplicationController
  def index
    @order_shipping = OrderShipping.new
  end

  def create
    binding.pry
  end
end
