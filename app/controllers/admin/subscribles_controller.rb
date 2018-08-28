class Admin::SubscriblesController < Admin::AdminsController
  def index
    @subscribles = Subscrible.all
  end
end
