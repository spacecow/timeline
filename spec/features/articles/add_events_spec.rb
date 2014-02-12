require 'spec_helper'

describe 'Article show, add events' do
  let(:article){ create :article }
  let(:event){ create :event, universe:article.universe }
  before do
    visit universe_path(article.universe)
    visit article_path(article)
    fill_in "Events", with:event_ids
    click_on "Update"
  end
  subject{ page }

  context "success" do
    let(:event_ids){ event.id }
    it{ should have_content "Event(s) added" }
  end

  context "failure" do
    let(:event_ids){ "kuk" }
    it{ should have_content "wrong universe" }
  end
end
