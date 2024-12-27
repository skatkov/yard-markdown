# Module: PP::PPMethods
    

Module that defines helper methods for pretty_print.



#Instance Methods
## check_inspect_key(id) [](#method-i-check_inspect_key)
Check whether the object_id `id` is in the current buffer of objects to be
pretty printed. Used to break cycles in chains of objects to be pretty
printed.

## comma_breakable() [](#method-i-comma_breakable)
A convenience method which is same as follows:

    text ','
    breakable

## guard_inspect_key() [](#method-i-guard_inspect_key)
Yields to a block and preserves the previous set of objects being printed.

## object_address_group(obj, &block) [](#method-i-object_address_group)
A convenience method, like object_group, but also reformats the Object's
object_id.

## object_group(obj, &block) [](#method-i-object_group)
A convenience method which is same as follows:

    group(1, '#<' + obj.class.name, '>') { ... }

## pop_inspect_key(id) [](#method-i-pop_inspect_key)
Removes an object from the set of objects being pretty printed.

## pp(obj) [](#method-i-pp)
Adds `obj` to the pretty printing buffer using Object#pretty_print or
Object#pretty_print_cycle.

Object#pretty_print_cycle is used when `obj` is already printed, a.k.a the
object reference chain has a cycle.

## pp_hash(obj) [](#method-i-pp_hash)
A pretty print for a Hash

## pp_hash_pair(k, v) [](#method-i-pp_hash_pair)
A pretty print for a pair of Hash

## pp_object(obj) [](#method-i-pp_object)
A present standard failsafe for pretty printing any given Object

## push_inspect_key(id) [](#method-i-push_inspect_key)
Adds the object_id `id` to the set of objects being pretty printed, so as to
not repeat objects.

## seplist(list, sepnil, iter_method:each) [](#method-i-seplist)
Adds a separated list. The list is separated by comma with breakable space, by
default.

#seplist iterates the `list` using `iter_method`. It yields each object to the
block given for #seplist. The procedure `separator_proc` is called between
each yields.

If the iteration is zero times, `separator_proc` is not called at all.

If `separator_proc` is nil or not given, +lambda { comma_breakable }+ is used.
If `iter_method` is not given, :each is used.

For example, following 3 code fragments has similar effect.

    q.seplist([1,2,3]) {|v| xxx v }

    q.seplist([1,2,3], lambda { q.comma_breakable }, :each) {|v| xxx v }

    xxx 1
    q.comma_breakable
    xxx 2
    q.comma_breakable
    xxx 3

