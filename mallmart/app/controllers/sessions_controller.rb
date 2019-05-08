class SessionsController < ApplicationController

  def new
  end

  def create
      @customer = Customer.find_by(username: params[:username])
    if @customer && @customer.authenticate(params[:password])
      session[:customer_id] = @customer.id
      redirect_to customer_path(@customer.id)
    else
      flash["notice"] = "Username or Password is incorrect!"
      render :new
    end

  end

  def destroy
    session.clear
    redirect_to login_path
  end

end
