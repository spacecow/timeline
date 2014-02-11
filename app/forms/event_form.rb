class EventForm
  include ActiveModel::Model

  attr_accessor :universe_id, :title
  validates :title, presence:true
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
      Event.create! universe_id:universe_id, title:title      
    end
end
