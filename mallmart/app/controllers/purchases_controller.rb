class PurchasesController < ApplicationController

  def index
    @purchases = Purchase.all
  end

  def create
    @purchase = Purchase.new(purchases_params)
    # inventory_id: params[:inventory_id], customer_id: params[:customer_id], purchased_quantity: params[:purchased_quantity]
  end

  private
  def purchases_params
    params.require(:purchase).permit(:customer_id, :inventory_id, :purchased_quantity)
  end
end
