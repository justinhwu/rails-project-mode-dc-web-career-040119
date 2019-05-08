class CustomersController < ApplicationController
  before_action :find_id, only: [:show, :edit, :update]
  def index
  end

  def show
    @customer = Customer.find(params[:id])
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
  @customer = Customer.find(params[:id])
end

def strong_params
  params.require(:customer).permit(:first_name, :last_name, :email, :phone_number, :address, :username, :password)
end

end
