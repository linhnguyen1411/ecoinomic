class User::UsersController < ApplicationController

  layout "user_manager"

  def index
    redirect_to user_path current_user
  end

  def show
  end

end
