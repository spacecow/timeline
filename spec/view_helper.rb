require 'rspec/its'

class ErbBinding
  def initialize(hash)
    hash.each do |key, value|
      singleton_class.send(:define_method,key){ value }
    end
  end
  def get_bindings; binding end
end
