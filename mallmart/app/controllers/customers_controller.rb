class CustomersController < ApplicationController
  before_action :find_id, only: [:show, :edit, :update]
  def index
  end

  def show
    @hash = {}
    @customer.purchases.each do |purchase|
      time = purchase.updated_at.strftime("%A, %B %d, %Y, %I")
        if @hash[time]
          @hash[time] << purchase
        else
          @hash[time] = [purchase]
        end
    end
    @new_hash = Hash.new
    @hash.each do |key, value|
      value.each do |purchase|
        item = Inventory.find(purchase.inventory_id)
        if @new_hash[key]
          @new_hash[key] << [item.name, purchase.purchased_quantity]
        else @new_hash[key]
          @new_hash[key] = [[item.name, purchase.purchased_quantity]]
        end
      end
    end
    @new_hash
  end

def new
  @customer= Customer.new
end

def create
  @customer = Customer.create(strong_params)
  session[:customer_id] = @customer.id
  if @customer.errors.empty?
     redirect_to customer_path(session[:customer_id])
  else
     render :new
  end

end

def edit
end

def update
  @customer.update(strong_params)
  redirect_to customer_path(@customer)
end

def destroy
  Customer.destroy(params[:id])
end

private

def find_id
  @customer = Customer.find(session[:customer_id])
end

def strong_params
  params.require(:customer).permit(:first_name, :last_name, :email, :phone_number, :address, :username, :password)
end

end
