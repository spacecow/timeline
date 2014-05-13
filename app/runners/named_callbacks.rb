class NamedCallbacks
  attr_accessor :callbacks

  def initialize
    self.callbacks = {}
  end

  def method_missing(sym, *args, &block)
    self.callbacks[sym] = block
  end

  def call name, *args
    name = name.to_sym
    cb = callbacks[name]
    cb ? cb.call(*args) : true
  end
end
