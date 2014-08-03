require 'spec_helper'

describe 'events/show.html.erb' do
  let(:event){ double :event, id:1 }
  let(:add_articles_form){ AddArticlesForm.new event }
  let(:rendering){ Capybara.string rendered }
  before do
    assign :add_articles_form, add_articles_form
    render 
  end
  subject(:div){ rendering.find '.participants' }
  it "check that article_ids are being displayed"
end
