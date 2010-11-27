$: << File.expand_path(File.dirname(__FILE__))
require 'layout_options/layout_options'
require 'layout_options/storage'

ActiveSupport.on_load :action_controller do
  include LayoutOptions
end
