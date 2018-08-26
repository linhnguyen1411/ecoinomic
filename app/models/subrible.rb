class Subrible < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates_format_of :email,
    with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/
end
