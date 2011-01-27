LayoutOptions.setup do |config|
  # layout_options assumes the default layout to use is the 'applicaiton' layout.
  # If this isn't the case just change the value here.
  #
  # When wouldn't you want the default layout to be 'application?' If you make a
  # rails engine and assume the 'application' layout, your views will conflict with
  # the 'application.html.erb' layout that gets generated with a rails install.
  config.default_layout = :application
end
