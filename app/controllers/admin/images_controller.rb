class Admin::ImagesController < Admin::AdminsController
  before_action :load_image, only: :create

  def index
    @images = Image.all
  end

  def create
    @image.assign_attributes load_params
    @status = @image.save
  end

  private

  def load_params
    params.require(:image).permit(:image_type, :image)
  end

  def load_image
    @image = Image.send(params[:image][:image_type]).first || Image.new
  end
end
