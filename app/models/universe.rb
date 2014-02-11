class Universe < ActiveRecord::Base
  has_many :articles
  has_many :events
end
