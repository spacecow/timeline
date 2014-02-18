require 'active_model'
require_relative '../../app/forms/add_articles_form'

describe AddArticlesForm do
  let(:form){ AddArticlesForm.new ids:[1], out_of:universe_ids }
  describe "#valid?" do
    subject{ form.valid? }

    context "success" do
      let(:universe_ids){ [1] }
      it{ should be true } 
    end

    context "failure" do
      let(:universe_ids){ [2] }
      it{ should be false } 
    end
  end
end
