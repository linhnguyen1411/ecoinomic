class Landing::LandingsController < Landing::BaseController
  def index
    setting = Stage.first
    time_now = Time.zone.now.to_datetime + 7.hour
    if setting.buy_coin?
      if (setting.start_date_1.to_datetime <= time_now && setting.end_date_1.to_datetime > time_now) || (setting.start_date_1 > time_now)
        if setting.start_date_1 > time_now
          @time_count = ((setting.start_date_1.to_datetime - time_now)*24*60*60).to_i
          @mess = "Presale will start in"
        else
          @time_count = ((setting.end_date_1.to_datetime - time_now)*24*60*60).to_i
          @mess = "Presale will end in"
        end
        @coin = setting.coin_1
      else
        if setting.start_date_2 > time_now
          @time_count = ((setting.start_date_2.to_datetime - time_now)*24*60*60).to_i
          @mess = "Crownsale will start in"
        else
          @time_count = ((setting.end_date_2.to_datetime - time_now)*24*60*60).to_i
          @mess = "Crownsale will end in"
        end
        @coin = setting.coin_2
      end
      @progress = setting.progess
    end

    return unless request.xhr?
    render json: {
      html: render_to_string(partial: "buy_coin")
    }
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
