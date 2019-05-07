class SessionsController < ApplicationController

  def new
  end

  def create
    @customer = Customer.find_by(username: params[:username])
    session[:customer_id] = @customer.id
    redirect_to customer_path(@customer.id)
  end
end
