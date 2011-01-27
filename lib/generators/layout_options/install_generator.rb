module LayoutOptions
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc 'prep the application to use layout_options'
      source_root File.expand_path('../templates', __FILE__)

      def application_controller_injection # :nodoc:
        inject_into_class 'app/controllers/application_controller.rb', ApplicationController do
         "  include LayoutOptions\n"
        end
      end

      def copy_initializer # :nodoc
        copy_file 'layout_options.rb', 'config/initializers/layout_options.rb'
      end
    end
  end
end
