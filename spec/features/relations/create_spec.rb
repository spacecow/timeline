require 'spec_helper'

describe 'Relation create' do
  let(:article){ create :article }
  before do
    create :article, universe:article.universe, name:'yeah'
    visit new_relation_path  from_article_id:article.id
  end

  context "success" do
    before do
      select "yeah", from:'To article'
      click_on 'Create'
    end
    describe Relation do
      subject{ Relation }
      its(:count){ should be 1 }
    end
    describe "created relation" do
      subject{ Relation.first }
      its(:from_article_id){ should be article.id }
    end
    describe "page" do
      subject{ page }
      it{ should have_content "Relation created" }
    end
  end

  context "failure" do
    before{ click_on 'Create' }
    describe "page" do
      subject{ page }
      it{ should have_content "can't be blank" }
    end
  end
end
