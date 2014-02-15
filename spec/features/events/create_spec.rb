require 'spec_helper'

describe 'Event create' do
  let(:universe){ create :universe }

  before do
    visit universe_path(universe)
    visit new_event_path
    fill_in 'Title', with:'The Trident'
  end

  context "success" do
    before{ click_on 'Create' }
    it{ page.should have_content 'Event created' }
  end

  context "failure" do
    before{ create :event, universe:universe, title:'The Trident'
            click_on 'Create' }
    it{ page.should have_content "has already been taken" }
  end
end
