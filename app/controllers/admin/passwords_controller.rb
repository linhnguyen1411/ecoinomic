# frozen_string_literal: true

class Admin::PasswordsController < Devise::PasswordsController
  # GET /resource/password/new
  # def new
  #   super
  # end

  # POST /resource/password
  def create
    admin = Admin.find_by email: params[:admin][:email]
    admin&.send_reset_password_instructions
    render json: {
      status: admin.present?,
      errors: "Admin not available.",
      message_success: t("devise.passwords.send_instructions"),
      html: render_to_string(partial: "user/passwords/send_mail_success")
    }
  end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/password
  def update
    admin = Admin.reset_password_by_token(resource_params)
    status = admin && admin.errors.empty?
    render json: {
      status: status,
      errors: admin&.errors&.full_messages || ["Reset password token is invalid"],
      redirect_path: admin_login_path
    }
  end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end
