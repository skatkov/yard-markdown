# Class: TestShapes
**Inherits:** Test::Unit::TestCase
    

These test the functionality of object shapes



#Instance Methods
## assert_shape_equal(shape1, shape2) [](#method-i-assert_shape_equal)
RubyVM::Shape.of returns new instances of shape objects for each call. This
helper method allows us to define equality for shapes

## ensure_complex() [](#method-i-ensure_complex)

## refute_shape_equal(shape1, shape2) [](#method-i-refute_shape_equal)

## test_array_has_root_shape() [](#method-i-test_array_has_root_shape)

## test_basic_shape_transition() [](#method-i-test_basic_shape_transition)

## test_cloning_with_freeze_option() [](#method-i-test_cloning_with_freeze_option)

## test_complex_freeze_after_clone() [](#method-i-test_complex_freeze_after_clone)

## test_delete_iv_after_complex() [](#method-i-test_delete_iv_after_complex)

## test_delete_undefined_after_complex() [](#method-i-test_delete_undefined_after_complex)

## test_different_objects_make_same_transition() [](#method-i-test_different_objects_make_same_transition)

## test_duplicating_objects() [](#method-i-test_duplicating_objects)

## test_duplicating_too_complex_objects_memory_leak() [](#method-i-test_duplicating_too_complex_objects_memory_leak)

## test_evacuate_class_ivar_and_compaction() [](#method-i-test_evacuate_class_ivar_and_compaction)

## test_evacuate_generic_ivar_and_compaction() [](#method-i-test_evacuate_generic_ivar_and_compaction)

## test_evacuate_generic_ivar_memory_leak() [](#method-i-test_evacuate_generic_ivar_memory_leak)

## test_evacuate_object_ivar_and_compaction() [](#method-i-test_evacuate_object_ivar_and_compaction)

## test_freeze_after_complex() [](#method-i-test_freeze_after_complex)

## test_freezing_and_cloning_object_with_ivars() [](#method-i-test_freezing_and_cloning_object_with_ivars)

## test_freezing_and_cloning_objects() [](#method-i-test_freezing_and_cloning_objects)

## test_freezing_and_cloning_string() [](#method-i-test_freezing_and_cloning_string)

## test_freezing_and_cloning_string_with_ivars() [](#method-i-test_freezing_and_cloning_string_with_ivars)

## test_freezing_and_duplicating_object() [](#method-i-test_freezing_and_duplicating_object)

## test_freezing_and_duplicating_object_with_ivars() [](#method-i-test_freezing_and_duplicating_object_with_ivars)

## test_freezing_and_duplicating_string_with_ivars() [](#method-i-test_freezing_and_duplicating_string_with_ivars)

## test_gc_stress_during_evacuate_generic_ivar() [](#method-i-test_gc_stress_during_evacuate_generic_ivar)

## test_iv_index() [](#method-i-test_iv_index)

## test_iv_order_correct_on_complex_objects() [](#method-i-test_iv_order_correct_on_complex_objects)

## test_iv_read_via_method_after_complex() [](#method-i-test_iv_read_via_method_after_complex)

## test_new_obj_has_t_object_shape() [](#method-i-test_new_obj_has_t_object_shape)

## test_nil_has_special_const_shape_id() [](#method-i-test_nil_has_special_const_shape_id)

## test_ordered_alloc_is_not_complex() [](#method-i-test_ordered_alloc_is_not_complex)

## test_out_of_bounds_shape() [](#method-i-test_out_of_bounds_shape)

## test_read_iv_after_complex() [](#method-i-test_read_iv_after_complex)

## test_read_method_after_complex() [](#method-i-test_read_method_after_complex)

## test_read_undefined_iv_after_complex() [](#method-i-test_read_undefined_iv_after_complex)

## test_remove_instance_variable() [](#method-i-test_remove_instance_variable)

## test_remove_instance_variable_capacity_transition() [](#method-i-test_remove_instance_variable_capacity_transition)

## test_remove_instance_variable_when_out_of_shapes() [](#method-i-test_remove_instance_variable_when_out_of_shapes)

## test_remove_then_add_again() [](#method-i-test_remove_then_add_again)

## test_removing_when_too_many_ivs_on_class() [](#method-i-test_removing_when_too_many_ivs_on_class)

## test_removing_when_too_many_ivs_on_module() [](#method-i-test_removing_when_too_many_ivs_on_module)

## test_root_shape_transition_to_special_const_on_frozen() [](#method-i-test_root_shape_transition_to_special_const_on_frozen)

## test_run_out_of_shape_during_remove_instance_variable() [](#method-i-test_run_out_of_shape_during_remove_instance_variable)

## test_run_out_of_shape_for_class_cvar() [](#method-i-test_run_out_of_shape_for_class_cvar)

## test_run_out_of_shape_for_class_ivar() [](#method-i-test_run_out_of_shape_for_class_ivar)

## test_run_out_of_shape_for_module_ivar() [](#method-i-test_run_out_of_shape_for_module_ivar)

## test_run_out_of_shape_for_object() [](#method-i-test_run_out_of_shape_for_object)

## test_run_out_of_shape_generic_instance_variable_set() [](#method-i-test_run_out_of_shape_generic_instance_variable_set)

## test_run_out_of_shape_generic_ivar_set() [](#method-i-test_run_out_of_shape_generic_ivar_set)

## test_run_out_of_shape_instance_variable_defined() [](#method-i-test_run_out_of_shape_instance_variable_defined)

## test_run_out_of_shape_instance_variable_defined_on_module() [](#method-i-test_run_out_of_shape_instance_variable_defined_on_module)

## test_run_out_of_shape_rb_obj_copy_ivar() [](#method-i-test_run_out_of_shape_rb_obj_copy_ivar)

## test_run_out_of_shape_remove_instance_variable() [](#method-i-test_run_out_of_shape_remove_instance_variable)

## test_shape_order() [](#method-i-test_shape_order)

## test_str_has_root_shape() [](#method-i-test_str_has_root_shape)

## test_too_complex() [](#method-i-test_too_complex)

## test_too_complex_generic_ivar_ractor_share() [](#method-i-test_too_complex_generic_ivar_ractor_share)

## test_too_complex_geniv() [](#method-i-test_too_complex_geniv)

## test_too_complex_obj_ivar_ractor_share() [](#method-i-test_too_complex_obj_ivar_ractor_share)

## test_too_complex_ractor() [](#method-i-test_too_complex_ractor)

## test_too_complex_ractor_shareable() [](#method-i-test_too_complex_ractor_shareable)

## test_too_many_ivs_on_class() [](#method-i-test_too_many_ivs_on_class)

## test_too_many_ivs_on_obj() [](#method-i-test_too_many_ivs_on_obj)

## test_true_has_special_const_shape_id() [](#method-i-test_true_has_special_const_shape_id)

## test_use_all_shapes_module() [](#method-i-test_use_all_shapes_module)

## test_use_all_shapes_then_freeze() [](#method-i-test_use_all_shapes_then_freeze)

## test_write_iv_after_complex() [](#method-i-test_write_iv_after_complex)

## test_write_method_after_complex() [](#method-i-test_write_method_after_complex)

