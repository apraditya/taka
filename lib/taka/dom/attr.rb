module Taka
  module DOM
    module Attr
      # workaround for the fact that we can not directly assing the attribute
      # to the parent node in Nokogiri. (or can we?)
      attr_accessor :_node

      def specified
        !!_node[self.name]
      end

      def parentNode
        nil
      end

      def attributes
        nil
      end
    end
  end
end
