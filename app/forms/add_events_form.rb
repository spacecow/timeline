class AddEventsForm
  include ActiveModel::Model

  attr_accessor :universe, :article, :event_tokens
  validate :events_belong_to_same_universe
  
  def initialize universe, article 
    self.universe = universe
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

    def event_ids
      event_tokens.split(',')
    end

    def persist!
      article.update event_ids:event_ids
    end
    
    def events_belong_to_same_universe
      universe.events.find event_ids 
    rescue ActiveRecord::RecordNotFound
      errors.add(:event_tokens, "wrong universe") 
    end

end
