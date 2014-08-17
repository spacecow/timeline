require 'spec_helper'

describe 'Relation create' do
  let(:article){ create :article }
  let(:params){ {from_article_id:article.id} }
  before{ visit new_relation_path params }

  context "success" do
    before{ click_on 'Create' }
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

  #context "failure" do
  #  let(:params){ {} }
  #  before{ click_on 'Create' }
  #  describe "page" do
  #    subject{ page }
  #    it{ should have_content "can't be blank" }
  #  end
  #end
end
