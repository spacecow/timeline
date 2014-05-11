class Runner
  attr_accessor :context, :repo

  def initialize context
    self.context = context
    self.repo = context.repo
  end
end
