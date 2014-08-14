class BaseForm
  include ActiveModel::Model
  attr_accessor :object

  def initialize object
    self.object = object
  end

  private

    def self.forms name
      define_method(name){ object }
    end

end
