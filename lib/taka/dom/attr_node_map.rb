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
      #   item._node = self
      #   document.decorate(item)
      # end
      
      def setNamedItem item
        if item._node && item._node != self._node
          raise DOMException.new(DOMException::INUSE_ATTRIBUTE_ERR)
        end
        super
      end
    end
  end
end
