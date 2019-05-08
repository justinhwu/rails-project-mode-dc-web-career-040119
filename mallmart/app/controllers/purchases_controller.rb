class PurchasesController < ApplicationController
  before_action :find_purchase, only: [:update]
  def index
    @purchases = Customer.find(session[:customer_id]
  end

  def create
    cart << params[:purchase]
    redirect_to purchases_path
  end


  def update
    @purchase.update(inventory_id: params[:inventory_id], customer_id: params[:customer_id], purchased_quantity: params[:purchased_quantity])
    # @purchase.update(purchases_params)
    redirect_to purchases_path
  end

  def checkout
  end

  private
  def find_purchase
    @purchase = Purchase.find(params[:id])
  end

  def get_cart_items
    cart.each do |item|
      
  end

  def purchases_params
    params.require(:purchase).permit(:customer_id, :inventory_id, :purchased_quantity)
  end
end
