class EventPresenter < BasePresenter
  presents :event

  def actions
    h.content_tag :ul, class: :actions do
      h.content_tag :li, class: :action do
        h.link_to "Add Relation", h.new_event_relation_path(event.id)
      end
    end
  end

end
