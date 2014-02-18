require 'spec_helper'

describe 'Article update after errors' do
  let(:image){ File.open "spec/image.jpg" }
  let(:article){ create :article, type:'Character', image:image }

  it "uploaded image is temporarily stored" do
    visit universe_path(article.universe)
    visit edit_article_path(article)
    page.find('img')[:src].should match  /thumb_image\.jpg/
    page.find('#article_image_cache').value.should be_nil
    fill_in 'Name', with:''
    attach_file 'Image', 'spec/image2.jpg'
    click_on 'Update'
    page.find('img')[:src].should match  /thumb_image2\.jpg/
    page.find('#article_image_cache').value.should match /image2\.jpg/
  end
end
