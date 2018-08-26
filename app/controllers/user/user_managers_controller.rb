class User::UserManagersController < ApplicationController
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  layout "user_manager"

  def index

  end
end
