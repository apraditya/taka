module DOM
  class TestCase < Test::Unit::TestCase

    KNOWN_ISSUES = {
      :nokogiri_entity_resolve_bug               => false,    # 10 failures, 19 errors
      :missing_default_values                    => false,    # 10 failures,  0 errors
      :node_normalize_not_implemented            => false,    #  0 failures,  5 errors
      :multiple_text_nodes_merged_problem        => false,    #  8 failures,  2 errors
      :public_id_not_implemented                 => false,    #  0 failures,  2 errors
      :processing_instruction_write_data         => false,    #  0 failures,  2 errors
      :node_clone_attributes_not_copied          => false,    #  2 failures,  0 errors
      :get_named_item_returning_empty_attribute  => false,    #  3 failures,  1 errors
      :various_exceptions_not_implemented        => false,    #  5 failures,  2 errors
      :attribute_reused_implementation           => false,    #  2 failures,  0 errors
      :entity_references_instead_of_text_nodes   => false,    #  0 failures,  1 errors
      :using_docfragments_instead_of_text_nodes  => false,    #  1 failures,  0 errors
      :nokogiri_ordered_hashes                   => false     #  1 failures,  0 errors
    }
    
    KNOWN_ISSUES.keys.each do |key|
      (class << self; self; end).send(:define_method, :"#{key}_solved?") { KNOWN_ISSUES[key] }
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
  end
end