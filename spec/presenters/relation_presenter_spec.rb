require 'spec_helper'

describe RelationPresenter do
  let(:relation){ double :relation }
  let(:presenter){ RelationPresenter.new relation, view }
  subject{ function }

  describe "#from_article_name" do
    let(:function){ presenter.from_article_name }
    before{ relation.should_receive(:from_article_name){ "Dan Josefsson" }}
    it{ should eq "Dan Josefsson" }
  end 
end
