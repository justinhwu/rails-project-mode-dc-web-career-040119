class PurchasesController < ApplicationController
  before_action :find_purchase, only: [:edit, :update]
  def index
    @customers = (Customer.find(session[:customer_id])).purchases

  end

  def create
    @purchase = Purchase.create(purchases_params)
    redirect_to purchases_path
  end

  def edit
  end

  def update
    
  end

  private
  def find_purchase
    @purchase = Purchase.find(params[:id])
  end

  def purchases_params
    params.require(:purchase).permit(:customer_id, :inventory_id, :purchased_quantity)
  end
end
