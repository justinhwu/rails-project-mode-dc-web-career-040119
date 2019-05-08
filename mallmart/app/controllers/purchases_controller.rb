class PurchasesController < ApplicationController
  before_action :find_purchase, only: [:update]
  before_action :get_cart_items, only: [:index]
  def index
    @purchases = Customer.find(session[:customer_id])
    byebug
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
    find_hash = Hash.new
    cart.each do |item|
      item_name = Inventory.find(item['inventory_id'])
      if !find_hash[item_name.name]
        find_hash[item_name.name] = [item['purchased_quantity'].to_i, item_name.price]
      else
        find_hash[item_name.name][0] += item['purchased_quantity'].to_i
      end
    end
    find_hash
  end

  def purchases_params
    params.require(:purchase).permit(:customer_id, :inventory_id, :purchased_quantity)
  end
end
