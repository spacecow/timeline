#require 'fast_helper'
#require 'active_model'
#require_relative '../../app/forms/add_events_form'
#
#class ActiveRecordError < StandardError; end
#module ActiveRecord
#  class RecordNotFound < ActiveRecordError; end
#  class Base; end
#end
#
#class Event < ActiveRecord::Base; end
#
#describe AddEventsForm do
#  let(:universe){ double }
#  let(:article){ double }
#  let(:form){ AddEventsForm.new universe, article }
#  before{ article.should_receive(:event_ids).and_return [1] }
#
#  describe "#valid?" do
#    subject{ form.valid? }
#
#    context "success" do
#      before{ universe.stub_chain(:events, :find) }
#      it{ should be true } 
#    end
#
#    context "failure" do
#      before{ universe.stub_chain(:events, :find).and_raise ActiveRecord::RecordNotFound }
#      it{ should be false } 
#    end
#  end
#end
