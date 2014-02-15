class EventForm
  include ActiveModel::Model

  attr_accessor :event, :title, :persisted
  validates :title, presence:true
  validate :uniqueness_of_title

  def initialize event, params={}, persisted = nil
    self.event = event
    self.title = event.title
    super params
    self.persisted = persisted
  end

  def save
    if valid?
      persist!
      true
    else
      false
    end
  end

  def id; event.id end
  def persisted?
    return persisted unless persisted.nil?
    event.new_record? ? false : true
  end

  private

    def persist!
      event.update! title:title      
    end

    def uniqueness_of_title
      errors.add(:title, 'has already been taken') if event_titles.include? title
    end

    def event_titles
      Event.all.map(&:title)
    end

end
