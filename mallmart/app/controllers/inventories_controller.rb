class InventoriesController < ApplicationController

  def index
    @inventories= Inventory.all
  end

  def show
    @inventory= Inventory.find(params[:id])
    @purchase = Purchase.new
    render layouts: 'application'
  end

  def add
    cart << params[:inventory]
  end

end
