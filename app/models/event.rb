class Event < ActiveRecord::Base
  belongs_to :universe

  has_many :participations, dependent: :destroy
  has_many :articles, through: :participations

  validates :universe, presence:true

  mount_uploader :image, ImageUploader
end
