class Article < ActiveRecord::Base
  belongs_to :universe 

  has_many :participations, dependent: :destroy
  has_many :events, through: :participations

  validates :universe, presence:true

  mount_uploader :image, ImageUploader

  def self.inherited(child)
    child.instance_eval do
      def model_name
        Article.model_name
      end
    end
    super
  end

end
