# Class: TestRDocParserC
**Inherits:** RDoc::TestCase
    

TODO: test call-seq parsing

/*
    *  call-seq:
    *     ARGF.readlines(sep=$/)     -> array
    *     ARGF.readlines(limit)      -> array
    *     ARGF.readlines(sep, limit) -> array
    *
    *     ARGF.to_a(sep=$/)     -> array
    *     ARGF.to_a(limit)      -> array
    *     ARGF.to_a(sep, limit) -> array
    *
    *  Reads +ARGF+'s current file in its entirety, returning an +Array+ of its
    *  lines, one line per element. Lines are assumed to be separated by _sep_.
    *
    *     lines = ARGF.readlines
    *     lines[0]                #=> "This is line one\n"
    */

assert call-seq did not stop at first empty line

/*
    * call-seq:
    *
    *  flt ** other  ->  float
    *
    * Raises <code>float</code> the <code>other</code> power.
    *
    *    2.0**3      #=> 8.0
    */

assert call-seq correct (bug: was empty)

/* call-seq: flt ** other  ->  float */

assert call-seq correct



#Instance Methods
## assert_do_attr(flags) [](#method-i-assert_do_attr)

## setup() [](#method-i-setup)

## teardown() [](#method-i-teardown)

## test_class_can_parse() [](#method-i-test_class_can_parse)

## test_define_method() [](#method-i-test_define_method)

## test_define_method_dynamically() [](#method-i-test_define_method_dynamically)

## test_define_method_private() [](#method-i-test_define_method_private)

## test_define_method_private_singleton() [](#method-i-test_define_method_private_singleton)

## test_define_method_singleton() [](#method-i-test_define_method_singleton)

## test_define_method_with_category() [](#method-i-test_define_method_with_category)

## test_define_method_with_prototype() [](#method-i-test_define_method_with_prototype)

## test_do_aliases() [](#method-i-test_do_aliases)

## test_do_aliases_missing_class() [](#method-i-test_do_aliases_missing_class)

## test_do_aliases_singleton() [](#method-i-test_do_aliases_singleton)

## test_do_classes_class() [](#method-i-test_do_classes_class)

## test_do_classes_class_under() [](#method-i-test_do_classes_class_under)

## test_do_classes_class_under_rb_path2class() [](#method-i-test_do_classes_class_under_rb_path2class)

## test_do_classes_duplicate_class() [](#method-i-test_do_classes_duplicate_class)

## test_do_classes_module() [](#method-i-test_do_classes_module)

## test_do_classes_module_under() [](#method-i-test_do_classes_module_under)

## test_do_classes_singleton() [](#method-i-test_do_classes_singleton)

## test_do_classes_struct() [](#method-i-test_do_classes_struct)

## test_do_classes_struct_under() [](#method-i-test_do_classes_struct_under)

## test_do_classes_struct_without_accessor() [](#method-i-test_do_classes_struct_without_accessor)

## test_do_classes_struct_without_accessor_under() [](#method-i-test_do_classes_struct_without_accessor_under)

## test_do_constants() [](#method-i-test_do_constants)

## test_do_constants_curses() [](#method-i-test_do_constants_curses)

## test_do_constants_file() [](#method-i-test_do_constants_file)

## test_do_constants_global() [](#method-i-test_do_constants_global)

## test_do_includes() [](#method-i-test_do_includes)

## test_do_methods_in_c() [](#method-i-test_do_methods_in_c)
HACK parsing warning instead of setting up in file

## test_do_methods_in_cpp() [](#method-i-test_do_methods_in_cpp)
HACK parsing warning instead of setting up in file

## test_do_methods_in_y() [](#method-i-test_do_methods_in_y)
HACK parsing warning instead of setting up in file

## test_do_methods_singleton_class() [](#method-i-test_do_methods_singleton_class)

## test_do_missing() [](#method-i-test_do_missing)

## test_do_missing_cycle() [](#method-i-test_do_missing_cycle)

## test_find_alias_comment() [](#method-i-test_find_alias_comment)

## test_find_attr_comment_document_attr() [](#method-i-test_find_attr_comment_document_attr)

## test_find_attr_comment_document_attr_oneline() [](#method-i-test_find_attr_comment_document_attr_oneline)

## test_find_attr_comment_document_attr_overlap() [](#method-i-test_find_attr_comment_document_attr_overlap)

## test_find_body() [](#method-i-test_find_body)

## test_find_body_2() [](#method-i-test_find_body_2)

## test_find_body_cast() [](#method-i-test_find_body_cast)

## test_find_body_define() [](#method-i-test_find_body_define)

## test_find_body_define_comment() [](#method-i-test_find_body_define_comment)

## test_find_body_document_method() [](#method-i-test_find_body_document_method)

## test_find_body_document_method_equals() [](#method-i-test_find_body_document_method_equals)

## test_find_body_document_method_same() [](#method-i-test_find_body_document_method_same)

## test_find_body_macro() [](#method-i-test_find_body_macro)

## test_find_body_static_inline() [](#method-i-test_find_body_static_inline)

## test_find_class_comment() [](#method-i-test_find_class_comment)

## test_find_class_comment_define_class() [](#method-i-test_find_class_comment_define_class)

## test_find_class_comment_define_class_Init_Foo() [](#method-i-test_find_class_comment_define_class_Init_Foo)

## test_find_class_comment_define_class_Init_Foo_no_void() [](#method-i-test_find_class_comment_define_class_Init_Foo_no_void)

## test_find_class_comment_define_class_bogus_comment() [](#method-i-test_find_class_comment_define_class_bogus_comment)

## test_find_class_comment_define_class_under() [](#method-i-test_find_class_comment_define_class_under)

## test_find_class_comment_define_class_under_Init() [](#method-i-test_find_class_comment_define_class_under_Init)

## test_find_class_comment_init() [](#method-i-test_find_class_comment_init)

## test_find_class_comment_initvm() [](#method-i-test_find_class_comment_initvm)

## test_find_const_comment_document_const() [](#method-i-test_find_const_comment_document_const)

## test_find_const_comment_document_const_full_name() [](#method-i-test_find_const_comment_document_const_full_name)

## test_find_const_comment_rb_define() [](#method-i-test_find_const_comment_rb_define)

## test_find_const_comment_rb_define_global() [](#method-i-test_find_const_comment_rb_define_global)

## test_find_modifiers_call_seq() [](#method-i-test_find_modifiers_call_seq)

## test_find_modifiers_nodoc() [](#method-i-test_find_modifiers_nodoc)

## test_find_modifiers_yields() [](#method-i-test_find_modifiers_yields)

## test_handle_method_args_0() [](#method-i-test_handle_method_args_0)

## test_handle_method_args_1() [](#method-i-test_handle_method_args_1)

## test_handle_method_args_2() [](#method-i-test_handle_method_args_2)

## test_handle_method_args_minus_1() [](#method-i-test_handle_method_args_minus_1)

## test_handle_method_args_minus_2() [](#method-i-test_handle_method_args_minus_2)
test_handle_args_minus_1 handled by test_handle_method

## test_handle_method_initialize() [](#method-i-test_handle_method_initialize)

## test_handle_singleton() [](#method-i-test_handle_singleton)

## test_initialize() [](#method-i-test_initialize)

## test_known_classes() [](#method-i-test_known_classes)

## test_load_variable_map() [](#method-i-test_load_variable_map)

## test_load_variable_map_empty() [](#method-i-test_load_variable_map_empty)

## test_load_variable_map_legacy() [](#method-i-test_load_variable_map_legacy)

## test_load_variable_map_singleton() [](#method-i-test_load_variable_map_singleton)

## test_load_variable_map_trim() [](#method-i-test_load_variable_map_trim)

## test_look_for_directives_in() [](#method-i-test_look_for_directives_in)

## test_markup_format_default() [](#method-i-test_markup_format_default)

## test_markup_format_override() [](#method-i-test_markup_format_override)

## test_rb_scan_args() [](#method-i-test_rb_scan_args)

## test_scan() [](#method-i-test_scan)

## test_scan_method_copy() [](#method-i-test_scan_method_copy)

## test_scan_order_dependent() [](#method-i-test_scan_order_dependent)

## util_get_class(content, namenil) [](#method-i-util_get_class)

## util_parser(content'') [](#method-i-util_parser)

