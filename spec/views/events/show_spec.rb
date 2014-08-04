require 'spec_helper'

describe 'events/show.html.erb' do
  let(:event){ mock_model(Event).as_null_object }
  let(:add_articles_form){ AddArticlesForm.new event }
  let(:rendering){ Capybara.string rendered }
  before do
    assign :add_articles_form, add_articles_form
    render 
  end

  it{ rendering.should have_selector 'ul.actions' }

end
