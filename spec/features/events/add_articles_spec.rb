require 'spec_helper'

describe 'Event show, add articles' do
  let(:event){ create :event }
  let(:article){ create :article, universe:event.universe }
  before do
    visit universe_path(event.universe)
    visit event_path(event)
    fill_in 'Articles', with:article_tokens
    click_on 'Update'
  end
  subject{ page }

  context "success" do
    let(:article_tokens){ article.id }
    it{ should have_content 'Articles updated' }
  end

  context "failure" do
    let(:article_tokens){ '666' }
    it{ should have_content "wrong universe" }
  end
end
