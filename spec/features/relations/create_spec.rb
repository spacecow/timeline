require 'spec_helper'

describe 'Relation create' do
  before do
    visit new_relation_path(from_article_id:666)
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
end
