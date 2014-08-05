require 'spec_helper'

describe 'articles/show.html.erb' do
  let(:article){ mock_model(Article).as_null_object }
  let(:add_events_form){ AddEventsForm.new article }
  let(:rendering){ Capybara.string rendered }
  before do
    add_events_form.should_receive(:events) #stack level too deep
    assign :add_events_form, add_events_form
    render
  end

  it{ rendering.should have_selector 'ul.actions' }

end
