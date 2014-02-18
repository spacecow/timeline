require 'spec_helper'

describe 'articles/_add_events_form.html.erb' do
  let(:article){ double id:1, events:[event] }
  let(:event){ double id:1 }
  let(:form){ AddEventsForm.new article }
  let(:rendering){ Capybara.string rendered }
  before{ article.should_receive(:event_ids).and_return [event.id]
          render 'add_events_form', add_events_form:form }

  describe 'Events' do
    subject(:div){ rendering.find '.article_event_tokens' }
    context 'value' do
      subject{ div.find 'input' }
      its(:value){ should eq '1' }
    end
  end
end
