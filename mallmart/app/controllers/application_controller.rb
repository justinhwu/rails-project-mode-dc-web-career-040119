class ApplicationController < ActionController::Base
helper_method :cart, :get_redirection, :image_array


def index
  render :layout => "application"
end

def cart
  session[:cart] ||= []
end

def image_array
  array = ["Socks.jpg", "Trackpants.jpg", "Yeezy Boost 350 V2 Hyperspace.jpg", "Triple White UltraBoosts.jpg", "Fritos.png"]
end


end
