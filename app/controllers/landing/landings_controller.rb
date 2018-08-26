class Landing::LandingsController < Landing::BaseController
  def index
    setting = Stage.first
    time_now = Time.zone.now.to_datetime
    if (setting.start_date_1.to_datetime <= time_now && setting.end_date_1.to_datetime > time_now) || (setting.start_date_1 > time_now)
      @time_count = ((setting.end_date_1.to_datetime - time_now)*24*60*60).to_i
      if setting.start_date_1 > time_now
        @mess = "Presale will start in"
      else
        @mess = "Presale will end in"
      end
      @coin = setting.coin_1
    else
      @time_count = ((setting.end_date_2.to_datetime - time_now)*24*60*60).to_i
      if setting.start_date_2 > time_now
        @mess = "Crownsale will start in"
      else
        @mess = "Crownsale will end in"
      end
      @coin = setting.coin_2
    end
    @progress = setting.progess
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
