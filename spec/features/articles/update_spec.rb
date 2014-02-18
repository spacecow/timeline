require 'spec_helper'

describe 'Article update' do
  let(:article){ create :article }
  before do
    visit universe_path(article.universe)
    visit edit_article_path(article)
    fill_in 'Name', with:'Cressen'
    select 'Character', from:'Type'
  end

  context "success" do
    before{ click_on 'Update' }
    it "updates an article" do
      page.should have_content 'Article updated'
      article.reload.name.should eq 'Cressen'
      article.reload.type.should eq 'Character'
    end
  end

  context "failure" do
    before{ create :article, universe:article.universe, name:'Cressen'
            click_on 'Update' }
    it{ page.should have_content "has already been taken" }
  end
end
