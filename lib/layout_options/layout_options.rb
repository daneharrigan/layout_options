module LayoutOptions
  def self.included(controller)
    controller.send(:include, LayoutOptions::InstanceMethods)
    controller.send(:extend, LayoutOptions::ClassMethods)
    controller.send(:layout, :layout_options_selector)
  end

  module ClassMethods
    def layout_options(args={})
      LayoutOptions::Storage[controller_name] = args
    end
  end

  module InstanceMethods
    def layout_options_selector
      layout_options = LayoutOptions::Storage[controller_name].clone || {}
      no_layout = layout_options.delete(:none) || []
      no_layout = [no_layout] unless Array === no_layout
      action = action_name.to_sym

      layout_options.each do |key, values|
        values = [values] unless Array === values
        return key.to_s if values.include?(action)
      end

      no_layout.map! { |value| value.to_sym }
      return no_layout.include?(action) ? false : 'application'
    end
  end
end
