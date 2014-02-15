require 'spec_helper'

describe 'Article create' do
  let(:universe){ create :universe }
  before do
    visit universe_path(universe)
    visit new_article_path
    fill_in 'Name', with:name
    attach_file 'Image', file 
    click_on 'Create'
  end

  context "success" do
    let(:name){ 'Cressen' }
    let(:file){ 'spec/image.jpg' }
    it{ page.should have_content 'Article created' }
    context "created article" do
      subject{ Article.last }
      its(:image_url){ should eq "/uploads/article/image/#{subject.id}/image.jpg" }
    end
  end

  context "name failure", focus:true do
    let(:name){ '' }
    let(:file){ 'spec/image.jpg' }
    it{ page.should have_content "can't be blank" }
  end

  context "file upload failure", focus:true do
    let(:name){ 'Cressen' }
    let(:file){ 'spec/virus.exe' }
    it{ page.should have_content "You are not allowed to upload" }
  end
end
