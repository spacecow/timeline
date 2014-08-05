class EventPresenter < BasePresenter
  presents :event

  def actions
    h.content_tag :ul, class: :actions do
    end
  end

end
