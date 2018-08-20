class User::ReferralsController < User::UserManagersController

  def index
    @users = User.by_referral current_user.id
  end
end
