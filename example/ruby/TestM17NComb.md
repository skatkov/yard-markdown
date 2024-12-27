# Class: TestM17NComb
**Inherits:** Test::Unit::TestCase
  
**Extended by:** TestM17NComb::AESU
    
**Includes:** TestM17NComb::AESU
  



# Class Methods
## a(str ) [](#method-c-a)
## b(str ) [](#method-c-b)
## e(str ) [](#method-c-e)
## s(str ) [](#method-c-s)
## u(str ) [](#method-c-u)

#Instance Methods
## a(str) [](#method-i-a)

## assert_enccall(recv, meth, *args, &block) [](#method-i-assert_enccall)

## assert_encoding(encname, actual, messagenil) [](#method-i-assert_encoding)

## assert_same_result(expected_proc, actual_proc) [](#method-i-assert_same_result)

## assert_str_enc_propagation(t, s1, s2) [](#method-i-assert_str_enc_propagation)

## assert_strenc(bytes, enc, actual, messagenil) [](#method-i-assert_strenc)

## b(str) [](#method-i-b)

## combination(*args, &b) [](#method-i-combination)

## crypt_supports_des_crypt?() [](#method-i-crypt_supports_des_crypt?)

**@return** [Boolean] 

## e(str) [](#method-i-e)

## each_slice_call() [](#method-i-each_slice_call)

## encdump(str) [](#method-i-encdump)

## encdumpargs(args) [](#method-i-encdumpargs)

## encdumpcall(recv, meth, *args, &block) [](#method-i-encdumpcall)

## s(str) [](#method-i-s)

## str_enc_compatible?(*strs) [](#method-i-str_enc_compatible?)

**@return** [Boolean] 

## test_bug11486() [](#method-i-test_bug11486)

## test_marshal() [](#method-i-test_marshal)

## test_sprintf_s() [](#method-i-test_sprintf_s)

## test_str_aref() [](#method-i-test_str_aref)

## test_str_aref_len() [](#method-i-test_str_aref_len)

## test_str_aref_range2() [](#method-i-test_str_aref_range2)

## test_str_aref_range3() [](#method-i-test_str_aref_range3)

## test_str_aref_substr() [](#method-i-test_str_aref_substr)

## test_str_assign() [](#method-i-test_str_assign)

## test_str_assign_len() [](#method-i-test_str_assign_len)

## test_str_assign_range2() [](#method-i-test_str_assign_range2)

## test_str_assign_range3() [](#method-i-test_str_assign_range3)

## test_str_assign_substr() [](#method-i-test_str_assign_substr)

## test_str_bytes() [](#method-i-test_str_bytes)

## test_str_bytesize() [](#method-i-test_str_bytesize)

## test_str_capitalize() [](#method-i-test_str_capitalize)

## test_str_casecmp() [](#method-i-test_str_casecmp)

## test_str_casecmp?() [](#method-i-test_str_casecmp?)

**@return** [Boolean] 

## test_str_center() [](#method-i-test_str_center)

## test_str_chars() [](#method-i-test_str_chars)

## test_str_chomp() [](#method-i-test_str_chomp)

## test_str_chop() [](#method-i-test_str_chop)

## test_str_chr() [](#method-i-test_str_chr)

## test_str_clear() [](#method-i-test_str_clear)

## test_str_clone() [](#method-i-test_str_clone)

## test_str_cmp() [](#method-i-test_str_cmp)

## test_str_concat() [](#method-i-test_str_concat)

## test_str_count() [](#method-i-test_str_count)

## test_str_crypt() [](#method-i-test_str_crypt)

## test_str_crypt_nonstrict() [](#method-i-test_str_crypt_nonstrict)

## test_str_delete() [](#method-i-test_str_delete)

## test_str_downcase() [](#method-i-test_str_downcase)

## test_str_dump() [](#method-i-test_str_dump)

## test_str_dup() [](#method-i-test_str_dup)

## test_str_each_byte() [](#method-i-test_str_each_byte)

## test_str_each_line() [](#method-i-test_str_each_line)

## test_str_empty?() [](#method-i-test_str_empty?)

**@return** [Boolean] 

## test_str_end_with?() [](#method-i-test_str_end_with?)

**@return** [Boolean] 

## test_str_eq() [](#method-i-test_str_eq)

## test_str_eq_reflexive() [](#method-i-test_str_eq_reflexive)

## test_str_eq_symmetric() [](#method-i-test_str_eq_symmetric)

## test_str_eq_transitive() [](#method-i-test_str_eq_transitive)

## test_str_hash() [](#method-i-test_str_hash)

## test_str_hex() [](#method-i-test_str_hex)

## test_str_include?() [](#method-i-test_str_include?)

**@return** [Boolean] 

## test_str_index() [](#method-i-test_str_index)

## test_str_insert() [](#method-i-test_str_insert)

## test_str_intern() [](#method-i-test_str_intern)

## test_str_length() [](#method-i-test_str_length)

## test_str_ljust() [](#method-i-test_str_ljust)

## test_str_new() [](#method-i-test_str_new)
tests start

## test_str_oct() [](#method-i-test_str_oct)

## test_str_ord() [](#method-i-test_str_ord)

## test_str_partition() [](#method-i-test_str_partition)

## test_str_plus() [](#method-i-test_str_plus)

## test_str_replace() [](#method-i-test_str_replace)

## test_str_reverse() [](#method-i-test_str_reverse)

## test_str_rindex() [](#method-i-test_str_rindex)

## test_str_rjust() [](#method-i-test_str_rjust)

## test_str_rpartition() [](#method-i-test_str_rpartition)

## test_str_scan() [](#method-i-test_str_scan)

## test_str_slice() [](#method-i-test_str_slice)

## test_str_slice!() [](#method-i-test_str_slice!)

## test_str_smart_chomp() [](#method-i-test_str_smart_chomp)

## test_str_split() [](#method-i-test_str_split)

## test_str_squeeze() [](#method-i-test_str_squeeze)

## test_str_start_with?() [](#method-i-test_str_start_with?)

**@return** [Boolean] 

## test_str_strip() [](#method-i-test_str_strip)

## test_str_sub() [](#method-i-test_str_sub)

## test_str_sub!() [](#method-i-test_str_sub!)

## test_str_succ() [](#method-i-test_str_succ)

## test_str_succ2() [](#method-i-test_str_succ2)

## test_str_sum() [](#method-i-test_str_sum)

## test_str_swapcase() [](#method-i-test_str_swapcase)

## test_str_times() [](#method-i-test_str_times)

## test_str_to_f() [](#method-i-test_str_to_f)

## test_str_to_i() [](#method-i-test_str_to_i)

## test_str_to_s() [](#method-i-test_str_to_s)

## test_str_upcase() [](#method-i-test_str_upcase)

## test_tr() [](#method-i-test_tr)

## test_tr_s() [](#method-i-test_tr_s)

## test_tr_sjis() [](#method-i-test_tr_sjis)

## u(str) [](#method-i-u)

