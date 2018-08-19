class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :avatar, AvatarUploader

  ATTR = [:email, :password, :password_confirmation]

  scope :by_referral, -> id {where ref_id: id}
end
