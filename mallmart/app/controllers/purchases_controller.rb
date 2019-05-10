class PurchasesController < ApplicationController
  before_action :find_purchase, only: [:update]
  helper_method :confirmation

  def index
    @customer = Customer.find(session[:customer_id])
    @cart = get_cart_items(cart)
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
    @purchase.update(inventory_id: params[:inventory_id], customer_id: params[:customer_id], purchased_quantity: params[:purchased_quantity])
    # @purchase.update(purchases_params)
    redirect_to checkout_path
  end

  def update_cart
    @customer = (Customer.find(session[:customer_id])).purchases
    @customer.each do |purchase|
      if (purchase.incart? == false)
        confirmation << purchase
      end
      purchase.update(incart?: true)
    end

    @customer.each do |purchase|
      item = Inventory.find(purchase.inventory_id)
      new_quantity = item.quantity - purchase.purchased_quantity
      item.update(quantity: new_quantity)
    end
    confirmation
    redirect_to place_order_path
  end

  def checkout
    cart.each do |purchase|
      Purchase.create(purchase)
    end
    session[:cart].clear
    @purchases = ((Customer.find(session[:customer_id])).purchases)
    @check = []
    @purchases.each do |purchase|
      if (purchase.incart? == false)
        @check << purchase
      end
    end
    @check
  end

  def place_order
    @customer = session[:customer_id]
    @confirmation = get_cart_items(confirmation)
    # @inventories = []
    # @purchased_quantity = []
    # confirmation.each do |purchase|
    #   @inventories << Inventory.find(purchase["inventory_id"])
    #   @purchased_quantity << purchase["purchased_quantity"]
    # end
    # @inventories
  end

  def destroy_order
    session[:confirmation].clear
    sleep 3
    redirect_to inventories_path
  end

  def destroy
    Purchase.destroy(params[:id])
    redirect_to checkout_path
  end

  private

  def confirmation
    session[:confirmation] ||= []
  end

  def find_purchase
    @purchase = Purchase.find(params[:id])
  end

  def get_cart_items(arg)
    find_hash = Hash.new
    arg.each do |item|
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
