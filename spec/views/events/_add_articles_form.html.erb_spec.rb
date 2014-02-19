require 'spec_helper'

describe 'events/_add_articles_form.html.erb' do
  let(:article){ double id:1 }
  let(:event){ double id:1, article_ids:[article.id], universe_article_ids:[] }
  let(:form){ AddArticlesForm.new event }
  let(:rendering){ Capybara.string rendered }
  before{ render 'add_articles_form', add_articles_form:form }

  describe 'Articles' do
    subject(:div){ rendering.find '.event_article_tokens' }
    context 'value' do
      subject{ div.find 'input' }
      its(:value){ should eq "1" }
    end
  end
end
