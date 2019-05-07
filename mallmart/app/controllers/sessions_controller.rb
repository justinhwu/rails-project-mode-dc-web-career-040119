class SessionsController < ApplicationController

  def new
  end

  def create
    @account = Account.find_by(username: params[:username])
    @customer = Customer.find_by(account_id: @account.id)
    session[:customer_id] = @customer.id
    redirect_to customer_path(@customer.id)
  end
end
