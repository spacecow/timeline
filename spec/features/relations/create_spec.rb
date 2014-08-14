require 'spec_helper'

describe 'Relation create' do
  let(:params){ {from_article_id:666} }
  before do
    visit new_relation_path params
  end

  context "success" do
    before{ click_on 'Create' }
    describe Relation do
      subject{ Relation }
      its(:count){ should be 1 }
    end
    describe "created relation" do
      subject{ Relation.first }
      its(:from_article_id){ should be 666 }
    end
  end

  context "failure" do
    let(:params){ {} }
    before{ click_on 'Create' }
    describe "page" do
      subject{ page }
      it{ should have_content "can't be blank" }
    end
  end
end
