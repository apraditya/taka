module Taka
  module DOM
    module AttrNodeMap
      include NamedNodeMap
      
      attr_accessor :_node
      
      # def createAttribute name
      #   Nokogiri::XML::Attr.new(document, name)
      # end
      #
      # def getNamedItem name
      #   item = self[name] || createAttribute(name)
      #   item._node_map = self
      #   document.decorate(item)
      # end
      
      def setNamedItem item
        if item._node_map && item._node_map != self
          raise DOMException.new(DOMException::INUSE_ATTRIBUTE_ERR)
        end
        super
      end
    end
  end
end
