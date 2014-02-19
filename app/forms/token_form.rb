class TokenForm
  include ActiveModel::Model

  attr_accessor :id, :tokens, :universe_ids

  validate :tokens_belong_to_same_universe

  def initialize id:0, tokens:"", universe_ids:[]
    self.id = id
    self.tokens = tokens
    self.universe_ids = universe_ids
  end

  def persisted?; true end

  def submit params
    self.tokens = params[token_field]
    if valid?
      #TODO save the addition!
      true
    else
      false
    end
  end

  def self.token_field field
    alias_method field, :tokens
    define_method(:token_field){ field }
  end

  private

    def unique_ids; tokens.split('.').map(&:to_i).uniq end

    def tokens_belong_to_same_universe
      errors.add(token_field, "wrong universe") unless (unique_ids - universe_ids).empty?
    end

end
