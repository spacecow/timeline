require 'spec_helper'

describe 'Article show' do
  let(:article){ create :article }
  let(:path){ article_path article }

  before do
    visit universe_path(article.universe)
    visit path
  end

  context "navigate to the new relation page" do
    before{ click_link 'Add Relation' }
    it{ current_path.should eq new_relation_path }
  end
end
