class Article < ActiveRecord::Base
  belongs_to :universe 

  has_many :participations, dependent: :destroy
  has_many :events, through: :participations

  validates :universe, presence:true

  mount_uploader :image, ImageUploader
end
