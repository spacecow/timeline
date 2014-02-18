require 'spec_helper'

describe 'Article show, add events' do
  let(:article){ create :article }
  let(:event){ create :event, universe:article.universe }
  before do
    visit universe_path(article.universe)
    visit article_path(article)
    fill_in "Events", with:event_tokens
    click_on "Update"
  end
  subject{ page }

  context "success" do
    let(:event_tokens){ event.id }
    it{ should have_content "Events updated" }
  end

  context "failure" do
    let(:event_tokens){ "666" }
    it{ should have_content "wrong universe" }
  end
end
