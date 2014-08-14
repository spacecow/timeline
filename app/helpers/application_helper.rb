module ApplicationHelper

  def present(object, klass = nil)
    object = object.object if object.respond_to?(:object)
    klass ||= "#{object.class}Presenter".constantize
    presenter = klass.new(object, self)
    yield presenter if block_given?
    presenter
  end

end
