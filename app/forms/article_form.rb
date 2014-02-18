class ArticleForm
  include ActiveModel::Model
  extend CarrierWave::Mount

  TYPES = %w(Character Place Organization)

  attr_reader :type
  attr_accessor :article, :name
  validates :name, presence:true
  validates :type, inclusion:TYPES
  validate :upload_must_be_image
  validate :uniqueness_of_name

  mount_uploader :image, ImageUploader

  def initialize article
    self.article = article
    self.name = article.name
    self.type = article.type
  end

  def image_url(version)
    image.url(version) || article.image_url(version) 
  end

  def type= type
    @type = type
    create_subclass_skeleton
  end

  def save params
    self.name = params[:name]
    self.type = params[:type]
    self.image = params[:image]
    self.image_cache = params[:image_cache]
    if valid?
      persist!
      true
    else
      false
    end
  end

  def id; article.id end
  def persisted?; article.new_record? ? false : true end

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
      errors.add(:name, 'has already been taken') if other_names.include? name
    end

    def persist!
      article.update! name:name, image:image, type:type
    end

    def other_names; other_articles.map(&:name) end
    def other_articles; universe_articles.reject{|e| e==article} end
    def universe_articles; universe.articles end 
    def universe; article.universe end

end
