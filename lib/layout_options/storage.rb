module LayoutOptions
  class Storage
    class << self
      def[](key) # :nodoc:
        @storage ||= {}
        @storage[key]
      end

      def []=(key, value) # :nodoc:
        @storage ||= {}
        @storage[key] = value
      end
    end
  end
end
