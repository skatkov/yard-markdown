# Class: Prism::LibrarySymbolsTest
**Inherits:** Prism::TestCase
    

examine a prism dll or static archive for expected external symbols.
    these tests only work on a linux system right now.



#Instance Methods
## global_nm_symbols(path) [](#method-i-global_nm_symbols)

## global_objdump_symbols(path) [](#method-i-global_objdump_symbols)

## hidden_global_objdump_symbols(path) [](#method-i-hidden_global_objdump_symbols)

## local_nm_symbols(path) [](#method-i-local_nm_symbols)

## names(symbol_lines) [](#method-i-names)
dig the symbol name out of each line. works for both `objdump` and `nm`
output.

## nm(path) [](#method-i-nm)
nm runner and helpers

## objdump(path) [](#method-i-objdump)
objdump runner and helpers

## setup() [](#method-i-setup)

## test_libprism_a_contains_hidden_pm_symbols() [](#method-i-test_libprism_a_contains_hidden_pm_symbols)

## test_libprism_a_contains_nothing_globally_visible() [](#method-i-test_libprism_a_contains_nothing_globally_visible)
static archive - libprism.a

## test_libprism_so_exports_only_the_necessary_functions() [](#method-i-test_libprism_so_exports_only_the_necessary_functions)
shared object - libprism.so

## test_prism_so_exports_only_the_C_extension_init_function() [](#method-i-test_prism_so_exports_only_the_C_extension_init_function)
shared object - prism.so

## visible_global_objdump_symbols(path) [](#method-i-visible_global_objdump_symbols)

