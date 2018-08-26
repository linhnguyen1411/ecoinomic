class Landing::LandingsController < Landing::BaseController
  def index
  end

  def subcrible
    status_sub =  Stage.first.subcrible?
    if status_sub
      subcrible = Subrible.new email: params[:email]
      status = subcrible.save
    end
    render json: {
      status: status,
      errors: subcrible&.errors&.full_messages,
      status_sub: status_sub
    }
  end
end
