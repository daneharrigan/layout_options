module LayoutOptions
  class Storage
    class << self
      def[](key)
        @storage ||= {}
        @storage[key]
      end

      def []=(key, value)
        @storage ||= {}
        @storage[key] = value
      end
    end
  end
end
