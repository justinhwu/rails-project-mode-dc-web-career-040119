class InventoriesController < ApplicationController

def index
@inventories= Inventory.all
end

def show
@inventory= Inventories.find(params[:id])
end

end
