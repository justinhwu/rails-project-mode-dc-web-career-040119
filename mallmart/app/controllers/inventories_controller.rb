class InventoriesController < ApplicationController

def index
@inventories= Inventory.all
end

def show
@inventory= Inventory.find(params[:id])
render :layout => false
end

end
