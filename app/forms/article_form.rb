class ArticleForm
  include ActiveModel::Model

  attr_accessor :universe_id, :name
  validates :name, presence:true
  validates :universe_id, presence:true

  def initialize universe_id, params={}
    self.universe_id = universe_id
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

    def persist!
      Article.create! universe_id:universe_id, name:name 
    end
end
