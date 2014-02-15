require 'spec_helper'

describe 'Event create with errors' do
  let(:universe){ create :universe }
  before do
    visit universe_path(universe)
    visit new_event_path
    fill_in 'Title', with:''
    attach_file 'Image', 'spec/image.jpg'
    click_on 'Create'
    fill_in 'Title', with:'The Trident'
    click_on 'Create'
  end

  context "success" do
    it{ page.should have_content 'Event created' }
    context "created event" do
      subject{ Event.last }
      its(:image_url){ should eq "/uploads/event/image/#{subject.id}/image.jpg" }
    end
  end
end
