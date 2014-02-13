require 'spec_helper'

describe 'events/edit.html.erb' do
  let(:event){ mock_model Event, title:'The Trident' }
  let(:event_form){ EventForm.new event }
  let(:rendering){ Capybara.string rendered }
  before do
    assign :event_form, event_form
    render
  end
  
  describe 'Title' do
    subject(:div){ rendering.find '.event_title' }
    context 'value' do
      subject{ div.find 'input' }
      its(:value){ should eq 'The Trident' }
    end
  end
end
