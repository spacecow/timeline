require 'spec_helper'

describe 'Event create' do
  before do
    visit new_event_path
    fill_in 'Title', with:title
    click_on 'Create'
  end

  context "success" do
    let(:title){ 'The Trident' }
    it{ page.should have_content 'Event created' }
    it{ Event.count.should be 1 }
  end

  context "failure" do
    let(:title){ '' }
    it{ page.should have_content "can't be blank" }
    it{ Event.count.should be 0 }
  end
end
