class ApplicationController < ActionController::Base
helper_method :cart, :find_name


def index
  render :layout => "application"
end

def cart
  session[:cart] ||= []
end

def find_name
  @name = (Customer.find(session[:customer_id])).full_name
end

end
