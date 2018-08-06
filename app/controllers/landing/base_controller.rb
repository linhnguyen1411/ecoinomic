class Landing::BaseController < ActionController::Base
  protect_from_forgery with: :exception
  layout "landing"
end
