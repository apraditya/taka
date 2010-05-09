map = {
  Taka::DOMException                   => [:code, :message],
  Taka::DOM::Document                  => [:doctype, :implementation, :documentElement],
  Taka::DOM::Node                      => [:nodeName, :nodeValue, :nodeType, :parentNode, :childNodes, :firstChild, :lastChild, :previousSibling, :nextSibling, :attributes, :ownerDocument, :namespaceURI, :prefix, :localName],
  Taka::DOM::NodeList                  => [:length],
  Taka::DOM::NamedNodeMap              => [:length],
  Taka::DOM::CharacterData             => [:data, :length],
  Taka::DOM::Attr                      => [:name, :specified, :value, :ownerElement],
  Taka::DOM::Element                   => [:tagName],
  Taka::DOM::DTD                       => [:name, :entities, :notations, :publicId, :systemId, :internalSubset],
  Taka::DOM::Notation                  => [:publicId, :systemId],
  Taka::DOM::EntityDecl                => [:publicId, :systemId, :notationName],
  Taka::DOM::ProcessingInstruction     => [:target, :data],
  
  Taka::DOM::HTML::Collection          => [:length],
  Taka::DOM::HTML::Document            => [:title, :referrer, :domain, :URL, :body, :images, :applets, :links, :forms, :anchors, :cookie],
  Taka::DOM::HTML::Element             => [:id, :title, :lang, :dir, :className],
  Taka::DOM::HTML::LinkElement         => [:disabled, :charset, :href, :hreflang, :media, :rel, :rev, :target, :type],
  Taka::DOM::HTML::MetaElement         => [:content, :httpEquiv, :name, :scheme],
  Taka::DOM::HTML::IsIndexElement      => [:form, :prompt],
  Taka::DOM::HTML::StyleElement        => [:disabled, :media, :type],
  Taka::DOM::HTML::BodyElement         => [:aLink, :background, :bgColor, :link, :text, :vLink],
  Taka::DOM::HTML::FormElement         => [:elements, :length, :name, :acceptCharset, :action, :enctype, :method, :target],
  Taka::DOM::HTML::SelectElement       => [:type, :selectedIndex, :value, :length, :form, :options, :disabled, :multiple, :name, :size, :tabIndex],
  Taka::DOM::HTML::OptionElement       => [:form, :defaultSelected, :text, :index, :disabled, :label, :selected, :value],
  Taka::DOM::HTML::InputElement        => [:defaultValue, :defaultChecked, :form, :accept, :accessKey, :align, :alt, :checked, :disabled, :maxLength, :name, :readOnly, :size, :src, :tabIndex, :type, :useMap, :value],
  Taka::DOM::HTML::TextAreaElement     => [:defaultValue, :form, :accessKey, :cols, :disabled, :name, :readOnly, :rows, :tabIndex, :type, :value],
  Taka::DOM::HTML::ButtonElement       => [:form, :accessKey, :disabled, :name, :tabIndex, :type, :value],
  Taka::DOM::HTML::LabelElement        => [:form, :accessKey, :htmlFor],
  Taka::DOM::HTML::FieldSetElement     => [:form],
  Taka::DOM::HTML::LegendElement       => [:form, :accessKey, :align],
  Taka::DOM::HTML::UListElement        => [:compact, :type],
  Taka::DOM::HTML::OListElement        => [:compact, :start, :type],
  Taka::DOM::HTML::LiElement           => [:type, :value],
  Taka::DOM::HTML::PreElement          => [:width],
  Taka::DOM::HTML::AnchorElement       => [:accessKey, :charset, :coords, :href, :hreflang, :name, :rel, :rev, :shape, :tabIndex, :target, :type],
  Taka::DOM::HTML::ImageElement        => [:name, :align, :alt, :border, :height, :hspace, :isMap, :longDesc, :src, :useMap, :vspace, :width],
  Taka::DOM::HTML::ObjectElement       => [:form, :code, :align, :archive, :border, :codeBase, :codeType, :data, :declare, :height, :hspace, :name, :standby, :tabIndex, :type, :useMap, :vspace, :width, :contentDocument],
  Taka::DOM::HTML::ParamElement        => [:name, :type, :value, :valueType],
  Taka::DOM::HTML::AppletElement       => [:align, :alt, :archive, :code, :codeBase, :height, :hspace, :name, :object, :vspace, :width],
  Taka::DOM::HTML::MapElement          => [:areas, :name],
  Taka::DOM::HTML::AreaElement         => [:accessKey, :alt, :coords, :href, :noHref, :shape, :tabIndex, :target],
  Taka::DOM::HTML::ScriptElement       => [:text, :htmlFor, :event, :charset, :defer, :src, :type],
  Taka::DOM::HTML::TableElement        => [:rows, :tBodies, :align, :bgColor, :border, :cellPadding, :cellSpacing, :frame, :rules, :summary, :width],
  Taka::DOM::HTML::TableSectionElement => [:align, :ch, :chOff, :vAlign, :rows],
  Taka::DOM::HTML::TableRowElement     => [:rowIndex, :sectionRowIndex, :cells, :align, :bgColor, :ch, :chOff, :vAlign],
  Taka::DOM::HTML::TableCellElement    => [:cellIndex, :abbr, :align, :axis, :bgColor, :ch, :chOff, :colSpan, :headers, :height, :noWrap, :rowSpan, :scope, :vAlign, :width],
  Taka::DOM::HTML::FrameElement        => [:frameBorder, :longDesc, :marginHeight, :marginWidth, :name, :noResize, :scrolling, :src],
  Taka::DOM::HTML::IFrameElement       => [:align, :frameBorder, :height, :longDesc, :marginHeight, :marginWidth, :name, :scrolling, :src, :width, :contentDocument],

  Taka::Event                          => [:type, :target, :currentTarget, :eventPhase, :bubbles, :cancelable, :timeStamp],
  Taka::EventException                 => [:code],

  Taka::Window                         => [:location, :navigator, :console, :parent, :name, :document, :defaultStatus, :history, :opener, :frames, :innerHeight, :innerWidth, :outerHeight, :outerWidth, :pageXOffset, :pageYOffset, :screenX, :screenY, :screenLeft, :screenTop],
  Taka::Window::Location               => [:hash, :host, :hostName, :href, :pathname, :port, :protocol, :search],
  Taka::Window::Frame                  => [:contentWindow],

  Exception                            => [:code, :message],

  # Taka::DOM::HTML::OptionsCollection   => [:length],
  # Taka::DOM::HTML::HtmlElement         => [:version],
  # Taka::DOM::HTML::HeadElement         => [:profile],
  # Taka::DOM::HTML::TitleElement        => [:text],
  # Taka::DOM::HTML::BaseElement         => [:href, :target],
  # Taka::DOM::HTML::OptGroupElement     => [:disabled, :label],
  # Taka::DOM::HTML::DListElement        => [:compact],
  # Taka::DOM::HTML::DirectoryElement    => [:compact],
  # Taka::DOM::HTML::MenuElement         => [:compact],
  # Taka::DOM::HTML::DivElement          => [:align],
  # Taka::DOM::HTML::ParagraphElement    => [:align],
  # Taka::DOM::HTML::HeadingElement      => [:align],
  # Taka::DOM::HTML::QuoteElement        => [:cite],
  # Taka::DOM::HTML::BRElement           => [:clear],
  # Taka::DOM::HTML::BaseFontElement     => [:color, :face, :size],
  # Taka::DOM::HTML::FontElement         => [:color, :face, :size],
  # Taka::DOM::HTML::HRElement           => [:align, :noShade, :size, :width],
  # Taka::DOM::HTML::ModElement          => [:cite, :dateTime],
  # Taka::DOM::HTML::TableCaptionElement => [:align],
  # Taka::DOM::HTML::TableColElement     => [:align, :ch, :chOff, :span, :vAlign, :width],
  # Taka::DOM::HTML::FrameSetElement     => [:cols, :rows],

  # Taka::UIEvent                        => [:view, :detail],
  # Taka::MouseEvent                     => [:screenX, :screenY, :clientX, :clientY, :ctrlKey, :shiftKey, :altKey, :metaKey, :button, :relatedTarget],
  # Taka::MutationEvent                  => [:relatedNode, :prevValue, :newValue, :attrName, :attrChange]
}

map.each do |const, js_properties|
  const.const_set(:JS_PROPERTIES, js_properties)
  const.class_eval <<-code
    def js_property?(name)
      JS_PROPERTIES.include?(name) || super 
    rescue
      false
    end
  code
end