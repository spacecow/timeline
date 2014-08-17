require 'spec_helper'

describe Relation do
  subject{ function }

  describe "validations" do
    let(:creation){ create :relation, from_article_id:from_article_id }
    context "alive article" do
      let(:article){ create :article }
      let(:from_article_id){ article.id }
      it{ expect{ creation }.to_not raise_error }
    end
    context "no article" do
      let(:from_article_id){ nil }
      it{ expect{ creation }.to raise_error {|e|
        e.should be_a ActiveRecord::StatementInvalid
        e.message.should match /doesn't have a default value/ 
      }}
    end
    context "dead article" do
      let(:from_article_id){ 666 }
      it{ expect{ creation }.to raise_error {|e|
        e.should be_a ActiveRecord::StatementInvalid
        e.message.should match /a foreign key constraint fails/ 
      }}
    end
  end

  describe "#from_article_name" do
    let(:article){ double :article, name:"Dan Josefsson" }
    let(:relation){ create :relation }
    let(:function){ relation.from_article_name }
    before{ relation.should_receive(:from_article){ article }}
    it{ should eq "Dan Josefsson" }
  end
end
