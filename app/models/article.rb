class Article < ActiveRecord::Base
  belongs_to :universe 

  validates :name, presence:true
  validates :universe, presence:true
end
