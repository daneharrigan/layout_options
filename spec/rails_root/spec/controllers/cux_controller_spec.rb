require 'spec_helper'

describe CuxController do
  describe '#index' do
    before(:each) do
      LayoutOptions.setup do |config|
        config.default_layout = :custom_default
      end
    end

    after(:each) do
      LayoutOptions.setup do |config|
        config.default_layout = :application
      end
    end

    it 'uses a different default layout' do
      get :index
      response.should render_template('layouts/custom_default')
    end
  end
end
