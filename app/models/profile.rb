class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :courses
  has_many :reviews
end
