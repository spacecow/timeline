require 'pry'

class AddEventsForm
  include ActiveModel::Model

  attr_accessor :article, :event_tokens
  validate :events_belong_to_same_universe
  
  def initialize article 
    self.article = article
    self.event_tokens = article.event_ids.join(',')
  end

  def id; article.id end
  def persisted?; true end

  def submit params
    self.event_tokens = params[:event_tokens]
    if valid?
      persist!
      true
    else
      false
    end
  end

  private

    def unique_event_ids; event_tokens.split(',').map(&:to_i).uniq end
    def persist!; article.update event_ids:unique_event_ids end
    
    def events_belong_to_same_universe
      errors.add(:event_tokens, "wrong universe") unless (unique_event_ids - universe_event_ids).empty?
    end

    def universe; article.universe end
    def universe_events; universe.events end
    def universe_event_ids; universe_events.map(&:id) end

end
