require 'spec_helper'

describe 'Article create' do
  let(:universe){ create :universe }
  before do
    visit universe_path(universe)
    visit new_article_path
    fill_in 'Name', with:''
    attach_file 'Image', 'spec/image.jpg'
    click_on 'Create'
    fill_in 'Name', with:'Cressen'
    click_on 'Create'
  end

  context "success" do
    it{ page.should have_content 'Article created' }
    context "created article" do
      subject{ Article.last }
      its(:image_url){ should eq "/uploads/article/image/#{subject.id}/image.jpg" }
    end
  end
end
