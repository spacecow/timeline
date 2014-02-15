require 'spec_helper'

describe 'events/_form.html.erb' do
  let(:event){ mock_model Event, title:'The Trident' }
  let(:event_form){ EventForm.new event }
  let(:rendering){ Capybara.string rendered }
  before{ render 'form', event_form:event_form }
  
  describe 'Title' do
    subject(:div){ rendering.find '.event_title' }
    context 'value' do
      subject{ div.find 'input' }
      its(:value){ should eq 'The Trident' }
    end
  end

  describe 'Image Cache' do
    subject(:div){ rendering.find '.event_image_cache' }
    it{ should_not have_selector 'label' }
    context 'value' do
      subject{ div.find 'input' }
      its([:type]){ should eq 'hidden' }
    end
  end
end
