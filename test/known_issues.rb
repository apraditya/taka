module DOM
  class TestCase < Test::Unit::TestCase

    KNOWN_ISSUES = {
      :nokogiri_entity_resolve_bug        => false,  # 10 failures, 19 errors
      :multiple_text_nodes_merged         => false,  #  8 failures,  2 errors
      :nokogiri_ordered_hashes            => false,  #  6 failures,  0 errors
      :default_attributes                 => false,  #  5 failures,  0 errors
      :node_normalize_not_implemented     => false,  #  0 failures,  5 errors
      :processing_instruction_write_data  => false,  #  0 failures,  2 errors
      :attribute_reused_implementation    => false,  #  2 failures,  0 errors
      :entity_references_and_text_nodes   => false,  #  0 failures,  1 errors
      :using_docfragments_and_text_nodes  => false,  #  1 failures,  0 errors
      :various_exceptions_not_implemented => false   #  5 failures,  2 errors
    }
    
    def self.solved?(issue)
      !ENV['SKIP_KNOWN_ISSUES'] || KNOWN_ISSUES[issue]
    end

    # nokogiri_entity_resolve_bug:

    # doc = load_document("staff", false)
    # docType = doc.doctype()
    # assert_not_nil(docType, "docTypeNotNull")
    # entities = docType.entities()
    # assert_not_nil(entities, "entitiesNotNull")
    # entityNode = entities.getNamedItem("ent1")
    # assert_not_nil(entityNode, "ent1NotNull")
    # nodeType = entityNode.nodeType()
    # assert_equal(6, nodeType, "entityNodeType") # is 17 instead
    
    # default_attributes
    #
    # basically, attributes must be able to find out whether they were specified.
    # or default attributes from the dtd. if an attribute is deleted and there's
    # a default attribute, the default attribute is supposed to be used
    
    # addressList = doc.getElementsByTagName("address")
    # testNode = addressList.item(0)
    # attributes = testNode.attributes()
    # streetAttr = attributes.getNamedItem("street")
    # state = streetAttr.specified()
    # assertFalse("streetNotSpecified", state)
    
    
    
  end
end