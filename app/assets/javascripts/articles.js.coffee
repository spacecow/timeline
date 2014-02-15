jQuery ->
  $('#article_event_tokens').tokenInput '/events.json',
    propertyToSearch: "title"
    prePopulate: $('#article_event_tokens').data('load')

