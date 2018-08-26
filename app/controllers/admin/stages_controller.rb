class Admin::StagesController < Admin::AdminsController
  def index
  end

  def create
    stage = Stage.first || Stage.new
    stage.assign_attributes stage_params
    status = stage.save
    render json: {
      status: status,
      errors: stage.errors.messages
    }
  end

  def load_data
    stage = Stage.first || Stage.new
    stage_types = Stage.enums_for_select("stage_types")

    render json: {
      stage: stage.as_json(methods: [:time_start_date_1, :time_end_date_1,
        :time_start_date_2, :time_end_date_2], only: [:stage_type, :progess, :coin_1, :coin_2]),
      stage_types: stage_types,
      attr_date: Stage::ATTR_DATE
    }
  end

  private
  def stage_params
    params.require(:stage).permit(:stage_type, :start_date_1, :end_date_1,
      :start_date_2, :end_date_2, :coin_1, :coin_2, :progess)
  end
end
