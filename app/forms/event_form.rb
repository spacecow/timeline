class EventForm
  include ActiveModel::Model

  attr_accessor :title
  validates :title, presence:true

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
      Event.create! title:title      
    end
end
