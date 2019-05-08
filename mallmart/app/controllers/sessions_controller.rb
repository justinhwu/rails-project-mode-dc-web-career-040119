class SessionsController < ApplicationController

  def new
  end

  def create
      @customer = Customer.find_by(username: params[:username])
    if @customer
      session[:customer_id] = @customer.id
      redirect_to customer_path(@customer.id)
    else
      flash["notice"] = "No user found with that username"
      render :new
    end

  end

  def destroy
    session.clear
    redirect_to login_path
  end

end
