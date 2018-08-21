class User::UsersController < User::UserManagersController
  def index
    redirect_to user_path current_user
  end

  def show
  end

  def change_password
    @user = current_user
    return unless request.xhr?
    @user.update_with_password password_params
    render json: {
      status: @user.errors.empty?,
      errors: @user.errors.full_messages,
      message_success: "Your password has been changed"
    }
  end

  private
  def password_params
    params.require(:user).permit(:current_password, :password, :password_confirmation);
  end
end
