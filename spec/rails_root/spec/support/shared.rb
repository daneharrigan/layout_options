shared_examples_for 'layout options' do
  describe '#new' do
    before(:each) { get :new, params }
    it { should render_template("#{controller.controller_name}/new") }
    it { should render_template('layouts/overlay') }
  end

  describe '#show' do
    before(:each) { get :show, params.merge(:id => 1) }
    it { should render_template("#{controller.controller_name}/show") }
    it { should render_template('layouts/application') }
  end

  describe '#create' do
    before(:each) { post :create, params }
    it { should render_template("#{controller.controller_name}/create") }

    it 'does not use a layout' do
      # i know i shouldn't be testing a private method, but i cant figure
      # out how to test that no layout is used
      controller.send(:_layout).should == false
    end
  end
end
