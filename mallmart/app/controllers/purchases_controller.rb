class PurchasesController < ApplicationController
  before_action :find_purchase, only: [:update, :update_cart]

  def index
    @customer = Customer.find(session[:customer_id])
    @cart = get_cart_items
  end

  def create
    cart << params[:purchase]
    redirect_to purchases_path
  end

  def clear_cart
    session[:cart].clear
    redirect_to purchases_path
  end

  def update
    @purchase.update(inventory_id: params[:inventory_id], customer_id: params[:customer_id], purchased_quantity: params[:purchased_quantity], incart?: true)
    # @purchase.update(purchases_params)
    redirect_to checkout_path
  end

  def update_cart
    @purchase.update(incart?: params[:incart?])
    redirect_to place_order_path
  end

  def checkout
    cart.each do |purchase|
      Purchase.create(purchase)
    end
    session[:cart].clear
    @purchases = (Customer.find(session[:customer_id])).purchases
  end

  def place_order

  end

  def destroy
    Purchase.destroy(params[:id])
    redirect_to checkout_path
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
