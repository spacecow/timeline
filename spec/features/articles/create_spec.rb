require 'spec_helper'

describe 'Article create' do
  let(:universe){ create :universe }
  let(:article){ Article.last }
  before do
    visit universe_path(universe)
    visit new_article_path
    fill_in 'Name', with:'Cressen'
    select 'Character', from:'Type'
  end

  context "success" do
    before{ click_on 'Create' }
    it "creates an article" do
      page.should have_content 'Article created'
      article.name.should eq 'Cressen' 
      article.type.should eq 'Character' 
    end
  end

  context "failure" do
    before{ create :article, universe:universe, name:'Cressen'
            click_on 'Create' }
    it{ page.should have_content "has already been taken" }
  end
end 
