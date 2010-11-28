require 'spec_helper'

class ApplicationController < ActionController::Base;end

class FooController < InheritedResources::Base
  layout_options :overlay => :edit, :none => :destroy
end

class BarController < InheritedResources::Base
  belongs_to :foo
  layout_options :overlay => [:edit, :new], :none => :destroy
end

class BazController < BarController
  layout_options :overlay => :show, :none => :create
end

describe LayoutOptions do
  let(:foo_controller) { FooController.new }
  let(:bar_controller) { BarController.new }
  let(:baz_controller) { BazController.new }

  describe FooController do
    describe '#edit' do
      it 'uses the overlay layout' do
        foo_controller.stub(:action_name => 'edit')
        foo_controller.layout_options_selector.should == 'overlay'
      end
    end

    describe '#show' do
      it 'uses the application layout' do
        foo_controller.stub(:action_name => 'show')
        foo_controller.layout_options_selector.should == 'application'
      end
    end

    describe '#destroy' do
      it 'uses no layout' do
        foo_controller.stub(:action_name => 'destroy')
        foo_controller.layout_options_selector.should == false
      end
    end
  end

  describe BarController do
    describe '#edit' do
      it 'uses the overlay layout' do
        bar_controller.stub(:action_name => 'edit')
        bar_controller.layout_options_selector.should == 'overlay'
      end
    end

    describe '#new' do
      it 'uses the overlay layout' do
        bar_controller.stub(:action_name => 'new')
        bar_controller.layout_options_selector.should == 'overlay'
      end
    end

    describe '#show' do
      it 'uses the application layout' do
        bar_controller.stub(:action_name => 'show')
        bar_controller.layout_options_selector.should == 'application'
      end
    end

    describe '#destroy' do
      it 'uses no layout' do
        bar_controller.stub(:action_name => 'destroy')
        bar_controller.layout_options_selector.should == false
      end
    end
  end

  describe BazController do
    describe '#show' do
      it 'uses the overlay layout' do
        baz_controller.stub(:action_name => 'show')
        baz_controller.layout_options_selector.should == 'overlay'
      end
    end

    describe '#create' do
      it 'uses no layout' do
        baz_controller.stub(:action_name => 'create')
        baz_controller.layout_options_selector.should == false
      end
    end
  end
end
