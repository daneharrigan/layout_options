class BarController < InheritedResources::Base
  layout_options :overlay => :new, :none => :create
  def new; end
  def show; end
  def create; end
end
