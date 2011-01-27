LayoutOptions.setup do |config|
  # layout_options assumes the default layout to use is the 'applicaiton' layout.
  # If this isn't the case just change the value here.
  #
  # "Why would I ever want a different default layout?"
  # Creating a stock rails app gives you an 'application.html.erb' layout file.
  # If you make a Rails engine and try to use an 'application' layout it will
  # pull the auto-generated one from the rails root. Setting your default layout
  # to something different, like the name of your engine, will fix the conflict.
  config.default_layout = :application
end
