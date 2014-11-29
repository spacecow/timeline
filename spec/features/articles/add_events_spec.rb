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

  context "success" do
    let(:event_tokens){ event.id }

    context "page" do
      subject{ page }
      it{ should have_content "Events updated" }
    end
    context "created participation" do
      subject{ Participation }
      its(:count){ should be 1 }
    end
  end

  context "failure" do
    let(:event_tokens){ "666" }
    subject{ page }
    it{ should have_content "wrong universe" }
  end

end
