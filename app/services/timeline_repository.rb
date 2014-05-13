class TimelineRepository
  include Repo::EventMethods

  attr_accessor :universe

  def initialize universe
    self.universe = universe
  end
end

