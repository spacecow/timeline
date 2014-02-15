class ArticleForm
  include ActiveModel::Model
  extend CarrierWave::Mount

  attr_accessor :article, :name, :image
  validates :name, presence:true
  validate :upload_must_be_image
  validate :uniqueness_of_name

  mount_uploader :image, ImageUploader

  def initialize article, params={}
    self.article = article
    self.name = article.name
    super params
  end

  def save
    if valid?
      persist!
      true
    else
      false
    end
  end

  private

    def upload_must_be_image
      error = image_integrity_error
      errors.add(:image, error.message) if error
    end

    def persist!
      article.update! name:name, image:image
    end

    def uniqueness_of_name
      errors.add(:name, 'has already been taken') if article_names.include? name
    end

    def article_names; universe.articles.map(&:name) end
    def universe; article.universe end

end
