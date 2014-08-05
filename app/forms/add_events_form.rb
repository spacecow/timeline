class AddEventsForm < TokenForm
  token_field :event_tokens
  attr_accessor :article

  def initialize article
    super id:article.id,
      tokens:article.event_ids.join(','),
      universe_ids:article.universe_event_ids
    self.article = article
  end

  def events; article.events end

  private

    def persist!
      article.event_ids = unique_ids
    end

end

#class AddEventsForm
#  include ActiveModel::Model
#
#  attr_accessor :article, :tokens
#  alias_method :event_tokens, :tokens
#
#  validate :events_belong_to_same_universe
#
#  def initialize article
#    self.article = article
#    self.tokens = article.event_ids.join(',')
#  end
#
#  def id; article.id end
#  def persisted?; true end
#  def events; article.events end
#
#  def submit params
#    self.tokens = params[:event_tokens]
#    if valid?
#      persist!
#      true
#    else
#      false
#    end
#  end
#
#  private
#
#    def unique_ids; tokens.split(',').map(&:to_i).uniq end
#    def persist!; article.update event_ids:unique_ids end
#
#    def events_belong_to_same_universe
#      errors.add(:event_tokens, "wrong universe") unless (unique_ids - universe_ids).empty?
#    end
#
#    def universe; article.universe end
#    def universe_events; universe.events end
#    def universe_ids; universe_events.map(&:id) end
#
#end
