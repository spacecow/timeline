require 'spec_helper'

describe Relation do
  subject{ function }

  describe "validations" do
    let(:from_article){ create :article }
    let(:to_article){ create :article }
    let(:from_article_id){ from_article.id }
    let(:to_article_id){ to_article.id }
    let(:creation){ create :relation,
      from_article_id:from_article_id, to_article_id:to_article_id }
    describe "to article is" do
      context "alive" do
        it{ expect{ creation }.to_not raise_error }
      end
      context "nil" do
        let(:to_article_id){ nil }
        it{ expect{ creation }.to raise_error {|e|
          e.should be_a ActiveRecord::StatementInvalid
          e.message.should match /doesn't have a default value/ 
        }}
      end
      context "dead" do
        let(:to_article_id){ 666 }
        it{ expect{ creation }.to raise_error {|e|
          e.should be_a ActiveRecord::StatementInvalid
          e.message.should match /a foreign key constraint fails/ 
        }}
      end
    end
    describe "from article is" do
      context "alive" do
        it{ expect{ creation }.to_not raise_error }
      end
      context "nil" do
        let(:from_article_id){ nil }
        it{ expect{ creation }.to raise_error {|e|
          e.should be_a ActiveRecord::StatementInvalid
          e.message.should match /doesn't have a default value/ 
        }}
      end
      context "dead" do
        let(:from_article_id){ 666 }
        it{ expect{ creation }.to raise_error {|e|
          e.should be_a ActiveRecord::StatementInvalid
          e.message.should match /a foreign key constraint fails/ 
        }}
      end
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
