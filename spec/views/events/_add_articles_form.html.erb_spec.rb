require 'spec_helper'

describe 'events/_add_articles_form.html.erb' do
  let(:rendering){ Capybara.string rendered }
  let(:event){ double }
  let(:form){ AddArticlesForm.new event }
  before{ render 'add_articles_form', add_articles_form:form }

  describe 'Articles' do
    subject(:div){ rendering.find '.event_article_tokens' }
    context 'value' do
      subject{ div.find 'input' }
      its(:value){ should eq '1' }
    end
  end
end
