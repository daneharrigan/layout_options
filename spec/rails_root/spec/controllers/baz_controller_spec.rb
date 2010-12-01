require 'spec_helper'

describe BazController do
  let(:params) { {:bar_id => 1 }.clone }
  it_should_behave_like 'layout options'
end
