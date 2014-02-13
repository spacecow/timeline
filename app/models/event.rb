class Event < ActiveRecord::Base
  belongs_to :universe

  has_many :participations, dependent: :destroy
  has_many :articles, through: :participations

  validates :title, presence:true, uniqueness:true
  validates :universe, presence:true
end
