class EventForm
  include ActiveModel::Model
  extend CarrierWave::Mount

  attr_accessor :event, :title, :image, :persisted
  validates :title, presence:true
  validate :uniqueness_of_title
  validate :upload_must_be_image

  mount_uploader :image, ImageUploader

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
      event.update! title:title, image:image
    end

    def upload_must_be_image
      error = image_integrity_error
      errors.add(:image, error.message) if error
    end

    def uniqueness_of_title
      errors.add(:title, 'has already been taken') if event_titles.include? title
    end

    def universe; @universe ||= event.universe end
    def event_titles; universe.events.map(&:title) end

end
