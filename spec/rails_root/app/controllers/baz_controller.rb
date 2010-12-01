class BazController < InheritedResources::Base
  belongs_to :bar
  layout_options :overlay => :new, :none => :create
  def new; end
  def show; end
  def create; end
end
