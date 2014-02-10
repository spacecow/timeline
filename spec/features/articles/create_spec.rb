require 'spec_helper'

describe 'Article create' do
  before do
    visit new_article_path
    fill_in 'Name', with:name
    click_on 'Create'
  end
  subject{ page }

  context "success" do
    let(:name){ 'Cressen' }
    it{ should have_content 'Article created' }
  end

  context "failure" do
    let(:name){ '' }
    it{ should have_content "can't be blank" }
  end
end
