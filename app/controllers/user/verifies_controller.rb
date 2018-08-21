class User::VerifiesController < User::UserManagersController
  before_action :load_user

  def index; end

  def update
    status_password = @user.valid_password?(user_params[:password])
    @user.assign_attributes user_params.except(:password)
    status = @user.save if status_password
    @user.errors.add :password, "is invalid" unless status_password
    render json: {
      status: status && status_password,
      errors: @user.errors.full_messages,
      message_success: "Your profile has been update"
    }
  end

  private
  def load_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(User::ATTR - [:email]).merge(is_verify_profile: true)
  end
end
