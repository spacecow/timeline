require 'spec_helper'

describe 'Event update' do
  let(:event){ create :event }

  before do
    visit universe_path(event.universe)
    visit edit_event_path(event)
    fill_in 'Title', with:title
    click_on 'Update'
  end

  context "success" do
    let(:title){ 'The Trident' }
    it{ page.should have_content 'Event updated' }
  end

  context "failure" do
    let(:title){ '' }
    it{ page.should have_content "can't be blank" }
  end
end
