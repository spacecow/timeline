class Article < ActiveRecord::Base
  validates :name, presence:true
end
