class User::ReferralsController < ApplicationController
  layout "user_manager"

  before_action :authenticate_user!
  def index
    @users = User.by_referral current_user.id
  end
end
