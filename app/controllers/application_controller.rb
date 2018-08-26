class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :layout_by_resource
  before_action :load_setting

  def load_setting
    @admin_setting = Stage.first
    @stage = @admin_setting.stage_type
  end

  private

  def layout_by_resource
    if devise_controller? && resource_name == :user
      "devise_user"
    elsif devise_controller? && resource_name == :admin
      "devise_admin"
    else
      "application"
    end
  end
end
