class PurchasesController < ApplicationController

  def create
    @purchase = Purchase.new(purchases_params(:customer_id, :inventory_id, :purchased_quantity))
    # inventory_id: params[:inventory_id], customer_id: params[:customer_id], purchased_quantity: params[:purchased_quantity]
    byebug
  end

  private
  def purchases_params(*args)
    params.require(:inventory).permit(*args)
  end
end
