class ArticleForm
  include ActiveModel::Model
  include Virtus.model

  attribute :name, String
  validates :name, presence:true

  def save
    if valid? 
      persist!
      true
    else
      false
    end
  end

  private

    def persist!
      Article.create! name:name 
    end
end
