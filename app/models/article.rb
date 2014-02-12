class Article < ActiveRecord::Base
  belongs_to :universe 

  has_many :participations, dependent: :destroy
  has_many :events, through: :participations

  validates :name, presence:true
  validates :universe, presence:true
end
