class ArticleForm
  include ActiveModel::Model

  attr_accessor :name
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
