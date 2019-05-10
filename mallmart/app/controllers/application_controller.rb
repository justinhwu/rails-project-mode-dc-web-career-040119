class ApplicationController < ActionController::Base
helper_method :cart, :get_redirection


def index
  render :layout => "application"
end

def cart
  session[:cart] ||= []
end




end
