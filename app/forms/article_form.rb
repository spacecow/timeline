class ArticleForm
  include ActiveModel::Model
  extend CarrierWave::Mount

  TYPES = %w(Character Place Organization) 

  attr_reader :type
  attr_accessor :article, :name, :image
  validates :name, presence:true
  validates :type, inclusion:TYPES
  validate :upload_must_be_image
  validate :uniqueness_of_name

  mount_uploader :image, ImageUploader

  def initialize article, params={}
    self.article = article
    self.name = article.name
    self.type = article.type
    super params
  end

  def type= type
    @type = type 
    create_subclass_skeleton
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

    def create_subclass_skeleton
      return unless TYPES.include? type
      file = "app/models/#{type.underscore}.rb"
      return if File.exists? file
      File.open file, "w" do |file|
        file.write "class #{type} < Article\n"
        file.write "end"
      end
    end

    def upload_must_be_image
      error = image_integrity_error
      errors.add(:image, error.message) if error
    end

    def uniqueness_of_name
      errors.add(:name, 'has already been taken') if article_names.include? name
    end

    def persist!
      article.update! name:name, image:image, type:type
    end

    def article_names; universe.articles.map(&:name) end
    def universe; article.universe end

end
