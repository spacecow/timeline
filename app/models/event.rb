class Event < ActiveRecord::Base
  belongs_to :universe

  has_many :participations, dependent: :destroy
  has_many :articles, through: :participations

  validates :universe, presence:true

  mount_uploader :image, ImageUploader

  def universe_article_ids; universe.article_ids end

  def self.same_universe event
    where(universe_id:event.universe_id)
  end

end
