module LayoutOptions
  mattr_accessor :default_layout
  @@default_layout = 'application'

  def self.included(controller) # :nodoc:
    controller.send(:include, LayoutOptions::InstanceMethods)
    controller.send(:extend, LayoutOptions::ClassMethods)
    controller.send(:layout, :layout_options_selector)
  end

  def self.setup
    yield(self)
  end


  module ClassMethods
    # layout_options - This method is available at the class level of your ApplicationController
    # and any controller that inherits from it.
    #
    # <tt>layout_options</tt> accepts a single hash where the index is the layout name and the
    # is the controller method(s) that will be using that layout. If you set the index to <tt>:none</tt>
    # no layout will be used. If no layout is specified it will default to using the
    # 'application' layout.
    #
    # All of the following examples will work controllers that inherit from <tt>InheritedResources::Base</tt>.
    #
    #   # setting an overlay layout for a new method
    #   class UsersController < ApplicationController
    #     layout_options :overlay => :new
    #   end
    #
    #   # setting an overlay layout for multiple methods
    #   class UsersController < ApplicationController
    #     layout_options :overlay => [:new, :edit]
    #   end
    #
    #   # not using a layout
    #   class UsersController < ApplicationController
    #     layout_options :none => [:create, :destroy]
    #   end
    #
    #   # using multiple layouts
    #   class UsersController < ApplicationController
    #     layout_options :overlay => [:new, :edit], :none => [:create, :destroy],
    #       :foo => :show
    #   end
    def layout_options(args={})
      LayoutOptions::Storage[controller_name] = args
    end
  end

  module InstanceMethods
    def layout_options_selector # :nodoc:
      layout_options = LayoutOptions::Storage[controller_name] || {}
      layout_options = layout_options.clone unless layout_options.empty?
      no_layout = layout_options.delete(:none) || []
      no_layout = [no_layout] unless Array === no_layout
      action = action_name.to_sym

      layout_options.each do |key, values|
        values = [values] unless Array === values
        return key.to_s if values.include?(action)
      end

      no_layout.map! { |value| value.to_sym }
      return no_layout.include?(action) ? false : LayoutOptions.default_layout.to_s
    end
  end
end
