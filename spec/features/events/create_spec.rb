require 'spec_helper'

describe 'Event create' do
  let(:universe){ create :universe }

  before do
    visit universe_path(universe)
    visit new_event_path
    fill_in 'Title', with:title
    click_on 'Create'
  end

  context "success" do
    let(:title){ 'The Trident' }
    it{ page.should have_content 'Event created' }
  end

  context "failure" do
    let(:title){ '' }
    it{ page.should have_content "can't be blank" }
  end
end
