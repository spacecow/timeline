require 'spec_helper'

describe 'relations/_form.html.erb' do
  #let(:event){ mock_model Event, title:'The Trident' }
  let(:article){ create :article, name:'Dan Josefsson' }
  let(:relation){ Relation.new from_article:article }
  let(:form){ RelationForm.new relation }
  let(:rendering){ Capybara.string rendered }
  before do
    create :article, name:'Thomas Quick', universe:article.universe
    render 'form', form:form
  end

  describe 'From article' do
    subject(:div){ rendering.find '.relation_from_article_id' }
    context 'value' do
      subject{ div.find 'input' }
      its(:value){ should eq article.id.to_s }
      its([:type]){ should eq 'hidden' }
    end
  end

  describe 'To article' do
    subject(:div){ rendering.find '.relation_to_article_id' }
    context 'options' do
      subject{ div.all 'select option' }
      it{ expect(subject.map(&:value)).to eq ["", "Thomas Quick"] }
    end
  end
end
