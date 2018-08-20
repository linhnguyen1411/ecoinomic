class User::UsersController < User::UserManagersController
  def index
    redirect_to user_path current_user
  end

  def show
  end

  def change_password
    if current_user.valid_password?(params[:old_password])
    end
  end
end
