class User::UserManagersController < ActionController::Base
  protect_from_forgery with: :exception
  layout "user_manager"

  def index

  end
end
