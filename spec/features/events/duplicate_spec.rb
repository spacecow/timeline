require 'spec_helper'

describe 'Event duplicate' do
  let(:event){ create :event, title:'The Trident' }

  before do
    visit universe_path(event.universe)
    visit duplicate_event_path(event)
    fill_in 'Title', with:title
    click_on 'Create'
  end

  context "success" do
    let(:title){ 'The Trident2' }
    it{ page.should have_content 'Event created' }
    it{ Event.count.should be 2 }
  end

  context "failure" do
    let(:title){ 'The Trident' }
    it{ page.should have_content "has already been taken" }
  end
end
