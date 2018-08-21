class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :avatar, AvatarUploader

  attr_accessor :is_verify_profile

  ATTR = [:email, :password, :password_confirmation, :first_name, :last_name,
    :country_id, :city]

  validates :first_name, :last_name, :country_id, :city, presence: true,
    if: :is_verify_profile

  belongs_to :country, optional: true

  scope :by_referral, -> id {where ref_id: id}
end
