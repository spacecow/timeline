require 'spec_helper'

describe 'events/_form.html.erb' do
  let(:event){ create :event, title:'The Trident', parent_event_id:666 }
  let(:event2){ create :event, title:'Same universe', universe:event.universe }
  let(:form){ EventForm.new event }
  let(:rendering){ Capybara.string rendered }
  before do
    create :event, title:'Other universe'
    event2
    render 'form', form:form
  end
  
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

  describe 'Parent Event' do
    subject(:div){ rendering.find '.event_parent_event_id' }
    context 'options' do
      subject{ div.all 'select option' }
      it{ expect(subject.map(&:value)).to eq ["", event2.id.to_s] }
    end
  end

end
