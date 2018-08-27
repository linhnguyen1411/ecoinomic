class Image < ApplicationRecord
  mount_uploader :image, ImageUploader
  enum image_type: {img_about: 1, img_solution_top: 2, img_solution_bot: 3,
    img_document: 4, img_app: 5, img_about_coin: 6, img_token_stats: 7}

  validates :image, presence: true
end
