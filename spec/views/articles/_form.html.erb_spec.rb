require 'spec_helper'

describe 'articles/_form.html.erb' do
  let(:article){ mock_model Article, name:'Cressen' }
  let(:article_form){ ArticleForm.new article }
  let(:rendering){ Capybara.string rendered }
  before{ render 'form', article_form:article_form }
  
  describe 'Title' do
    subject(:div){ rendering.find '.article_name' }
    context 'value' do
      subject{ div.find 'input' }
      its(:value){ should eq 'Cressen' }
    end
  end
end
