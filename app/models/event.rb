class Event < ActiveRecord::Base
  belongs_to :universe

  validates :title, presence:true
  validates :universe, presence:true
end
