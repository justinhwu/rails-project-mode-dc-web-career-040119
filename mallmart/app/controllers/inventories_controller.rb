class InventoriesController < ApplicationController

  def index
    @inventories= Inventory.all
  end

  def show
    @inventory= Inventory.find(params[:id])
    @purchase = Purchase.new
    render layout: false
  end

  def add
    cart << params[:inventory]
  end

end
