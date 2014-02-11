class EventForm
  include ActiveModel::Model
  include Virtus.model
  #TODO remove virtus

  attribute :title, String
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
