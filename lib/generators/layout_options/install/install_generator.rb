module LayoutOptions
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc 'prep the application to use layout_options'

      def application_controller_injection # :nodoc:
        inject_into_class 'app/controllers/application_controller.rb', ApplicationController do
         "  include LayoutOptions\n"
        end
      end
    end
  end
end
