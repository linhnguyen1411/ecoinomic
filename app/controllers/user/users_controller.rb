class User::UsersController < User::UserManagersController
  def index
    redirect_to user_path current_user
  end

  def show
  end

  def change_password
    @user = current_user
    return unless request.xhr?
    status = @user.update_with_password password_params
    bypass_sign_in @user if status
    render json: {
      status: status,
      errors: @user.errors.full_messages,
      message_success: "Your password has been changed"
    }
  end

  private
  def password_params
    params.require(:user).permit(:current_password, :password, :password_confirmation);
  end
end
