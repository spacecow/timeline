class BasePresenter
  attr_accessor :object, :template

  def initialize object, template
    self.object = object
    self.template = template
  end

  private
  
    def self.presents name
      define_method(name){ object }
    end

    def h; template end

end
