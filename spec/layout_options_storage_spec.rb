require 'spec_helper'

describe LayoutOptions::Storage do
  describe '[]=' do
    it 'storages the values' do
      LayoutOptions::Storage[:key] = :value
    end
  end

  describe '[]' do
    before(:each) { LayoutOptions::Storage[:key] = :value }
    it 'it returns the value stored' do
      LayoutOptions::Storage[:key].should == :value
    end
  end
end
