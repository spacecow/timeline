require 'spec_helper'

describe 'Article create with errors' do
  let(:universe){ create :universe }
  before do
    visit universe_path(universe)
    visit new_article_path
    fill_in 'Name', with:''
    select 'Organization', from:'Type'
    attach_file 'Image', 'spec/image.jpg'
    click_on 'Create'
    page.find('img')[:src].should match  /thumb_image\.jpg/
    page.find('#article_image_cache').value.should match /image\.jpg/
    fill_in 'Name', with:'Cressen'
    click_on 'Create'
  end

  context "created image" do
    subject{ Article.last }
    its(:image_url){ should eq "/uploads/article/image/#{subject.id}/image.jpg" }
  end
end
