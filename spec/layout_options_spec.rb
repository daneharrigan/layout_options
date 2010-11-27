require 'spec_helper'

class FooController < ActionController::Base
  layout_options :overlay => :edit, :none => :destroy
end

describe LayoutOptions do
  let(:controller) { FooController.new }
  describe '#edit' do
    it 'uses the overlay layout' do
      controller.stub(:action_name => 'edit')
      controller.layout_options_selector.should == 'overlay'
    end
  end

  describe '#show' do
    it 'uses the application layout' do
      controller.stub(:action_name => 'show')
      controller.layout_options_selector.should == 'application'
    end
  end

  describe '#destroy' do
    it 'uses no layout' do
      controller.stub(:action_name => 'destroy')
      controller.layout_options_selector.should == false
    end
  end
end
