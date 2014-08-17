require 'spec_helper'

describe 'relations/_form.html.erb' do
  #let(:event){ mock_model Event, title:'The Trident' }
  let(:article){ create :article }
  let(:relation){ create :relation, from_article:article }
  let(:form){ RelationForm.new relation }
  let(:rendering){ Capybara.string rendered }
  before{ render 'form', form:form }

  describe 'From article' do
    subject(:div){ rendering.find '.relation_from_article_id' }
    context 'value' do
      subject{ div.find 'input' }
      its(:value){ should eq article.id.to_s }
      its([:type]){ should eq 'hidden' }
    end
  end
end
