class Admin::StagesController < Admin::AdminsController
  def index
  end

  def create
  end

  def load_data
    stage = Stage.first
    stage_types = Stage.enums_for_select("stage_types")

    render json: {
      stage: stage,
      stage_types: stage_types
    }
  end
end
