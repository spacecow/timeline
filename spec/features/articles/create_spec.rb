require 'spec_helper'

describe 'Article create' do
  let(:universe){ create :universe }
  before do
    #TODO select a universe
    universe
    visit new_article_path
    fill_in 'Name', with:name
    click_on 'Create'
  end

  context "success" do
    let(:name){ 'Cressen' }
    it{ page.should have_content 'Article created' }
    it{ Article.count.should be 1 }
  end

  context "failure" do
    let(:name){ '' }
    it{ page.should have_content "can't be blank" }
    it{ Article.count.should be 0 }
  end
end
