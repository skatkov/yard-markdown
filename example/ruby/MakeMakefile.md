# Module: MakeMakefile
  
**Extended by:** MakeMakefile
    

mkmf.rb is used by Ruby C extensions to generate a Makefile which will
correctly compile and link the C extension to Ruby and a third-party library.


# Class Methods
## append_cflags(flags , **opts ) [](#method-c-append_cflags)
Check whether each given C compiler flag is acceptable and append it to
`$CFLAGS` if so.

`flags`
:   a C compiler flag as a `String` or an `Array` of them

## append_cppflags(flags , **opts ) [](#method-c-append_cppflags)
Check whether each given C preprocessor flag is acceptable and append it to
`$CPPFLAGS` if so.

`flags`
:   a C preprocessor flag as a `String` or an `Array` of them

## append_ldflags(flags , **opts ) [](#method-c-append_ldflags)
Check whether each given linker flag is acceptable and append it to `$LDFLAGS`
if so.

`flags`
:   a linker flag as a `String` or an `Array` of them

## append_library(libs , lib ) [](#method-c-append_library)
:no-doc:
## arg_config(config , default nil, &block ) [](#method-c-arg_config)
:stopdoc:
## cc_command(opt "") [](#method-c-cc_command)
## cc_config(opt "") [](#method-c-cc_config)
## check_signedness(type , headers nil, opts nil, &b ) [](#method-c-check_signedness)
Returns the signedness of the given `type`.  You may optionally specify
additional `headers` to search in for the `type`.

If the `type` is found and is a numeric type, a macro is passed as a
preprocessor constant to the compiler using the `type` name, in uppercase,
prepended with `SIGNEDNESS_OF_`, followed by the `type` name, followed by `=X`
where "X" is positive integer if the `type` is unsigned and a negative integer
if the `type` is signed.

For example, if `size_t` is defined as unsigned, then
`check_signedness('size_t')` would return +1 and the `SIGNEDNESS_OF_SIZE_T=+1`
preprocessor macro would be passed to the compiler.  The
`SIGNEDNESS_OF_INT=-1` macro would be set for `check_signedness('int')`
## check_sizeof(type , headers nil, opts "", &b ) [](#method-c-check_sizeof)
Returns the size of the given `type`.  You may optionally specify additional
`headers` to search in for the `type`.

If found, a macro is passed as a preprocessor constant to the compiler using
the type name, in uppercase, prepended with `SIZEOF_`, followed by the type
name, followed by `=X` where "X" is the actual size.

For example, if `check_sizeof('mystruct')` returned 12, then the
`SIZEOF_MYSTRUCT=12` preprocessor macro would be passed to the compiler.
## checking_for(m , fmt nil) [](#method-c-checking_for)
This emits a string to stdout that allows users to see the results of the
various have* and find* methods as they are tested.

Internal use only.
## checking_message(target , place nil, opt nil) [](#method-c-checking_message)
Build a message for checking.

Internal use only.
## config_string(key , config CONFIG) [](#method-c-config_string)
:stopdoc:
## configuration(srcdir ) [](#method-c-configuration)
## conftest_source() [](#method-c-conftest_source)
Returns the language-dependent source file name for configuration checks.
## convertible_int(type , headers nil, opts nil, &b ) [](#method-c-convertible_int)
Returns the convertible integer type of the given `type`.  You may optionally
specify additional `headers` to search in for the `type`. *convertible* means
actually the same type, or typedef'd from the same type.

If the `type` is an integer type and the *convertible* type is found, the
following macros are passed as preprocessor constants to the compiler using
the `type` name, in uppercase.

*   `TYPEOF_`, followed by the `type` name, followed by `=X` where "X" is the
    found *convertible* type name.
*   `TYP2NUM` and `NUM2TYP`, where `TYP` is the `type` name in uppercase with
    replacing an `_t` suffix with "T", followed by `=X` where "X" is the macro
    name to convert `type` to an Integer object, and vice versa.

For example, if `foobar_t` is defined as unsigned long, then
`convertible_int("foobar_t")` would return "unsigned long", and define these
macros:

    #define TYPEOF_FOOBAR_T unsigned long
    #define FOOBART2NUM ULONG2NUM
    #define NUM2FOOBART NUM2ULONG
## cpp_command(outfile , opt "") [](#method-c-cpp_command)
## cpp_include(header ) [](#method-c-cpp_include)
## create_header(header "extconf.h") [](#method-c-create_header)
Generates a header file consisting of the various macro definitions generated
by other methods such as have_func and have_header. These are then wrapped in
a custom `#ifndef` based on the `header` file name, which defaults to
"extconf.h".

For example:

    # extconf.rb
    require 'mkmf'
    have_func('realpath')
    have_header('sys/utime.h')
    create_header
    create_makefile('foo')

The above script would generate the following extconf.h file:

    #ifndef EXTCONF_H
    #define EXTCONF_H
    #define HAVE_REALPATH 1
    #define HAVE_SYS_UTIME_H 1
    #endif

Given that the create_header method generates a file based on definitions set
earlier in your extconf.rb file, you will probably want to make this one of
the last methods you call in your script.
## create_makefile(target , srcprefix nil) [](#method-c-create_makefile)
Generates the Makefile for your extension, passing along any options and
preprocessor constants that you may have generated through other methods.

The `target` name should correspond the name of the global function name
defined within your C extension, minus the `Init_`.  For example, if your C
extension is defined as `Init_foo`, then your target would simply be "foo".

If any "/" characters are present in the target name, only the last name is
interpreted as the target name, and the rest are considered toplevel directory
names, and the generated Makefile will be altered accordingly to follow that
directory structure.

For example, if you pass "test/foo" as a target name, your extension will be
installed under the "test" directory.  This means that in order to load the
file within a Ruby program later, that directory structure will have to be
followed, e.g. `require 'test/foo'`.

The `srcprefix` should be used when your source files are not in the same
directory as your build script. This will not only eliminate the need for you
to manually copy the source files into the same directory as your build
script, but it also sets the proper `target_prefix` in the generated Makefile.

Setting the `target_prefix` will, in turn, install the generated binary in a
directory under your `RbConfig::CONFIG['sitearchdir']` that mimics your local
filesystem when you run `make install`.

For example, given the following file tree:

    ext/
      extconf.rb
      test/
        foo.c

And given the following code:

    create_makefile('test/foo', 'test')

That will set the `target_prefix` in the generated Makefile to "test". That,
in turn, will create the following file tree when installed via the `make
install` command:

    /path/to/ruby/sitearchdir/test/foo.so

It is recommended that you use this approach to generate your makefiles,
instead of copying files around manually, because some third party libraries
may depend on the `target_prefix` being set properly.

The `srcprefix` argument can be used to override the default source directory,
i.e. the current directory.  It is included as part of the `VPATH` and added
to the list of `INCFLAGS`.
## create_tmpsrc(src ) [](#method-c-create_tmpsrc)
Creats temporary source file from `COMMON_HEADERS` and *src*. Yields the
created source string and uses the returned string as the source code, if the
block is given.
## depend_rules(depend ) [](#method-c-depend_rules)
Processes the data contents of the "depend" file.  Each line of this file is
expected to be a file name.

Returns the output of findings, in Makefile format.
## dir_config(target , idefault nil, ldefault nil) [](#method-c-dir_config)
call-seq:
    dir_config(target)
    dir_config(target, prefix)
    dir_config(target, idefault, ldefault)

Sets a `target` name that the user can then use to configure various "with"
options with on the command line by using that name.  For example, if the
target is set to "foo", then the user could use the `--with-foo-dir=prefix`,
`--with-foo-include=dir` and `--with-foo-lib=dir` command line options to tell
where to search for header/library files.

You may pass along additional parameters to specify default values.  If one is
given it is taken as default `prefix`, and if two are given they are taken as
"include" and "lib" defaults in that order.

In any case, the return value will be an array of determined "include" and
"lib" directories, either of which can be nil if no corresponding command line
option is given when no default value is specified.

Note that dir_config only adds to the list of places to search for libraries
and include files.  It does not link the libraries into your application.
## dir_re(dir ) [](#method-c-dir_re)
## dummy_makefile(srcdir ) [](#method-c-dummy_makefile)
Creates a stub Makefile.
## each_compile_rules() [](#method-c-each_compile_rules)
:nodoc:
## egrep_cpp(pat , src , opt "", &b ) [](#method-c-egrep_cpp)
Returns whether or not the `src` can be preprocessed with the C preprocessor
and matches with `pat`.

If a block given, it is called with the source before compilation. You can
modify the source in the block.

`pat`
:   a Regexp or a String

`src`
:   a String which contains a C source

`opt`
:   a String which contains preprocessor options


NOTE: When pat is a Regexp the matching will be checked in process, otherwise
egrep(1) will be invoked to check it.
## enable_config(config , default nil) [](#method-c-enable_config)
Tests for the presence of an `--enable-`*config* or `--disable-`*config*
option. Returns `true` if the enable option is given, `false` if the disable
option is given, and the default value otherwise.

This can be useful for adding custom definitions, such as debug information.

Example:

    if enable_config("debug")
       $defs.push("-DOSSL_DEBUG") unless $defs.include? "-DOSSL_DEBUG"
    end
## env_quote(envs ) [](#method-c-env_quote)
## expand_command(commands , envs libpath_env) [](#method-c-expand_command)
## find_executable(bin , path nil) [](#method-c-find_executable)
Searches for the executable `bin` on `path`.  The default path is your `PATH`
environment variable. If that isn't defined, it will resort to searching
/usr/local/bin, /usr/ucb, /usr/bin and /bin.

If found, it will return the full path, including the executable name, of
where it was found.

Note that this method does not actually affect the generated Makefile.
## find_executable0(bin , path nil) [](#method-c-find_executable0)
:nodoc:

This method is used internally by the find_executable method.

Internal use only.
## find_header(header , *paths ) [](#method-c-find_header)
Instructs mkmf to search for the given `header` in any of the `paths`
provided, and returns whether or not it was found in those paths.

If the header is found then the path it was found on is added to the list of
included directories that are sent to the compiler (via the `-I` switch).
## find_library(lib , func , *paths , &b ) [](#method-c-find_library)
Returns whether or not the entry point `func` can be found within the library
`lib` in one of the `paths` specified, where `paths` is an array of strings. 
If `func` is `nil` , then the `main()` function is used as the entry point.

If `lib` is found, then the path it was found on is added to the list of
library paths searched and linked against.
## find_type(type , opt , *headers , &b ) [](#method-c-find_type)
Returns where the static type `type` is defined.

You may also pass additional flags to `opt` which are then passed along to the
compiler.

See also `have_type`.
## have_const(const , headers nil, opt "", &b ) [](#method-c-have_const)
Returns whether or not the constant `const` is defined.  You may optionally
pass the `type` of `const` as `[const, type]`, such as:

    have_const(%w[PTHREAD_MUTEX_INITIALIZER pthread_mutex_t], "pthread.h")

You may also pass additional `headers` to check against in addition to the
common header files, and additional flags to `opt` which are then passed along
to the compiler.

If found, a macro is passed as a preprocessor constant to the compiler using
the type name, in uppercase, prepended with `HAVE_CONST_`.

For example, if `have_const('foo')` returned true, then the `HAVE_CONST_FOO`
preprocessor macro would be passed to the compiler.
## have_devel?() [](#method-c-have_devel?)
:stopdoc:
**@return** [Boolean] 

## have_framework(fw , &b ) [](#method-c-have_framework)
Returns whether or not the given `framework` can be found on your system. If
found, a macro is passed as a preprocessor constant to the compiler using the
framework name, in uppercase, prepended with `HAVE_FRAMEWORK_`.

For example, if `have_framework('Ruby')` returned true, then the
`HAVE_FRAMEWORK_RUBY` preprocessor macro would be passed to the compiler.

If `fw` is a pair of the framework name and its header file name that header
file is checked, instead of the normally used header file which is named same
as the framework.
## have_func(func , headers nil, opt "", &b ) [](#method-c-have_func)
Returns whether or not the function `func` can be found in the common header
files, or within any `headers` that you provide.  If found, a macro is passed
as a preprocessor constant to the compiler using the function name, in
uppercase, prepended with `HAVE_`.

To check functions in an additional library, you need to check that library
first using `have_library()`.  The `func` shall be either mere function name
or function name with arguments.

For example, if `have_func('foo')` returned `true`, then the `HAVE_FOO`
preprocessor macro would be passed to the compiler.
## have_header(header , preheaders nil, opt "", &b ) [](#method-c-have_header)
Returns whether or not the given `header` file can be found on your system. If
found, a macro is passed as a preprocessor constant to the compiler using the
header file name, in uppercase, prepended with `HAVE_`.

For example, if `have_header('foo.h')` returned true, then the `HAVE_FOO_H`
preprocessor macro would be passed to the compiler.
## have_library(lib , func nil, headers nil, opt "", &b ) [](#method-c-have_library)
Returns whether or not the given entry point `func` can be found within `lib`.
 If `func` is `nil`, the `main()` entry point is used by default.  If found,
it adds the library to list of libraries to be used when linking your
extension.

If `headers` are provided, it will include those header files as the header
files it looks in when searching for `func`.

The real name of the library to be linked can be altered by `--with-FOOlib`
configuration option.
## have_macro(macro , headers nil, opt "", &b ) [](#method-c-have_macro)
Returns whether or not `macro` is defined either in the common header files or
within any `headers` you provide.

Any options you pass to `opt` are passed along to the compiler.
## have_struct_member(type , member , headers nil, opt "", &b ) [](#method-c-have_struct_member)
Returns whether or not the struct of type `type` contains `member`.  If it
does not, or the struct type can't be found, then false is returned. You may
optionally specify additional `headers` in which to look for the struct (in
addition to the common header files).

If found, a macro is passed as a preprocessor constant to the compiler using
the type name and the member name, in uppercase, prepended with `HAVE_`.

For example, if `have_struct_member('struct foo', 'bar')` returned true, then
the `HAVE_STRUCT_FOO_BAR` preprocessor macro would be passed to the compiler.

`HAVE_ST_BAR` is also defined for backward compatibility.
## have_type(type , headers nil, opt "", &b ) [](#method-c-have_type)
Returns whether or not the static type `type` is defined.  You may optionally
pass additional `headers` to check against in addition to the common header
files.

You may also pass additional flags to `opt` which are then passed along to the
compiler.

If found, a macro is passed as a preprocessor constant to the compiler using
the type name, in uppercase, prepended with `HAVE_TYPE_`.

For example, if `have_type('foo')` returned true, then the `HAVE_TYPE_FOO`
preprocessor macro would be passed to the compiler.
## have_typeof?() [](#method-c-have_typeof?)
Used internally by the what_type? method to check if the *typeof* GCC
extension is available.
**@return** [Boolean] 

## have_var(var , headers nil, opt "", &b ) [](#method-c-have_var)
Returns whether or not the variable `var` can be found in the common header
files, or within any `headers` that you provide.  If found, a macro is passed
as a preprocessor constant to the compiler using the variable name, in
uppercase, prepended with `HAVE_`.

To check variables in an additional library, you need to check that library
first using `have_library()`.

For example, if `have_var('foo')` returned true, then the `HAVE_FOO`
preprocessor macro would be passed to the compiler.
## init_mkmf(config CONFIG, rbconfig RbConfig::CONFIG) [](#method-c-init_mkmf)
:stopdoc:
## install_dirs(target_prefix nil) [](#method-c-install_dirs)
## install_files(mfile , ifiles , map nil, srcprefix nil) [](#method-c-install_files)
## install_rb(mfile , dest , srcdir nil) [](#method-c-install_rb)
## libpath_env() [](#method-c-libpath_env)
## libpathflag(libpath $DEFLIBPATH|$LIBPATH) [](#method-c-libpathflag)
## link_command(ldflags , *opts ) [](#method-c-link_command)
## link_config(ldflags , opt "", libpath $DEFLIBPATH|$LIBPATH) [](#method-c-link_config)
## log_src(src , heading "checked program was") [](#method-c-log_src)
Logs *src*
## macro_defined?(macro , src , opt "", &b ) [](#method-c-macro_defined?)
This is used internally by the have_macro? method.
**@return** [Boolean] 

## map_dir(dir , map nil) [](#method-c-map_dir)
## merge_libs(*libs ) [](#method-c-merge_libs)
## message(*s ) [](#method-c-message)
Prints messages to $stdout, if verbose mode.

Internal use only.
## mkintpath(path ) [](#method-c-mkintpath)
## mkmf_failed(path ) [](#method-c-mkmf_failed)
Returns whether or not the Makefile was successfully generated. If not, the
script will abort with an error message.

Internal use only.
## modified?(target , times ) [](#method-c-modified?)
Returns time stamp of the `target` file if it exists and is newer than or
equal to all of `times`.
**@return** [Boolean] 

## pkg_config(pkg , *options ) [](#method-c-pkg_config)
Returns compile/link information about an installed library in a tuple of
`[cflags, ldflags, libs]`, by using the command found first in the following
commands:

1.  If `--with-{pkg}-config={command}` is given via command line option:
    `{command} {options}`

2.  `{pkg}-config {options}`

3.  `pkg-config {options} {pkg}`

Where `options` is the option name without dashes, for instance `"cflags"` for
the `--cflags` flag.

The values obtained are appended to `$INCFLAGS`, `$CFLAGS`, `$LDFLAGS` and
`$libs`.

If one or more `options` argument is given, the config command is invoked with
the options and a stripped output string is returned without modifying any of
the global values mentioned above.
## relative_from(path , base ) [](#method-c-relative_from)
## rm_f(*files ) [](#method-c-rm_f)
Removes *files*.
## rm_rf(*files ) [](#method-c-rm_rf)
Removes *files* recursively.
## scalar_ptr_type?(type , member nil, headers nil, &b ) [](#method-c-scalar_ptr_type?)
Used internally by the what_type? method to determine if `type` is a scalar
pointer.
**@return** [Boolean] 

## scalar_type?(type , member nil, headers nil, &b ) [](#method-c-scalar_type?)
Used internally by the what_type? method to determine if `type` is a scalar
pointer.
**@return** [Boolean] 

## split_libs(*strs ) [](#method-c-split_libs)
:stopdoc:
## timestamp_file(name , target_prefix nil) [](#method-c-timestamp_file)
## try_cflags(flags , werror: true, **opts ) [](#method-c-try_cflags)
:nodoc:
## try_compile(src , opt "", werror: nil, **opts , &b ) [](#method-c-try_compile)
Returns whether or not the `src` can be compiled as a C source.  `opt` is
passed to the C compiler as options. Note that `$CFLAGS` is also passed to the
compiler.

If a block given, it is called with the source before compilation. You can
modify the source in the block.

`src`
:   a String which contains a C source

`opt`
:   a String which contains compiler options

## try_const(const , headers nil, opt "", &b ) [](#method-c-try_const)
:nodoc: Returns whether or not the constant `const` is defined.

See also `have_const`
## try_constant(const , headers nil, opt "", &b ) [](#method-c-try_constant)
## try_cpp(src , opt "", **opts , &b ) [](#method-c-try_cpp)
Returns whether or not the `src` can be preprocessed with the C preprocessor. 
`opt` is passed to the preprocessor as options. Note that `$CFLAGS` is also
passed to the preprocessor.

If a block given, it is called with the source before preprocessing. You can
modify the source in the block.

`src`
:   a String which contains a C source

`opt`
:   a String which contains preprocessor options

## try_cppflags(flags , werror: true, **opts ) [](#method-c-try_cppflags)
:nodoc:
## try_do(src , command , **opts , &b ) [](#method-c-try_do)
## try_func(func , libs , headers nil, opt "", &b ) [](#method-c-try_func)
You should use `have_func` rather than `try_func`.

`func`
:   a String which contains a symbol name

`libs`
:   a String which contains library names.

`headers`
:   a String or an Array of strings which contains names of header files.

## try_ldflags(flags , werror: $mswin, **opts ) [](#method-c-try_ldflags)
:nodoc:
## try_link(src , opt "", **opts , &b ) [](#method-c-try_link)
Returns whether or not the `src` can be compiled as a C source and linked with
its depending libraries successfully.  `opt` is passed to the linker as
options. Note that `$CFLAGS` and `$LDFLAGS` are also passed to the linker.

If a block given, it is called with the source before compilation. You can
modify the source in the block.

`src`
:   a String which contains a C source

`opt`
:   a String which contains linker options

## try_link0(src , opt "", ldflags: "", **opts , &b ) [](#method-c-try_link0)
:nodoc:
## try_run(src , opt "", &b ) [](#method-c-try_run)
Returns whether or not:
*   the `src` can be compiled as a C source,
*   the result object can be linked with its depending libraries successfully,
*   the linked file can be invoked as an executable
*   and the executable exits successfully

`opt` is passed to the linker as options. Note that `$CFLAGS` and `$LDFLAGS`
are also passed to the linker.

If a block given, it is called with the source before compilation. You can
modify the source in the block.

`src`
:   a String which contains a C source

`opt`
:   a String which contains linker options


Returns true when the executable exits successfully, false when it fails, or
nil when preprocessing, compilation or link fails.
## try_signedness(type , member , headers nil, opts nil) [](#method-c-try_signedness)
**@raise** [ArgumentError] 

## try_static_assert(expr , headers nil, opt "", &b ) [](#method-c-try_static_assert)
:stopdoc:
## try_type(type , headers nil, opt "", &b ) [](#method-c-try_type)
:nodoc: Returns whether or not the static type `type` is defined.

See also `have_type`
## try_var(var , headers nil, opt "", &b ) [](#method-c-try_var)
You should use `have_var` rather than `try_var`.
## typedef_expr(type , headers ) [](#method-c-typedef_expr)
## werror_flag(opt nil) [](#method-c-werror_flag)
## what_type?(type , member nil, headers nil, &b ) [](#method-c-what_type?)
Returns a string represents the type of *type*, or *member* of *type* if
*member* is not `nil`.
**@return** [Boolean] 

## winsep(s ) [](#method-c-winsep)
Converts forward slashes to backslashes. Aimed at MS Windows.

Internal use only.
## with_cflags(flags ) [](#method-c-with_cflags)
Sets `$CFLAGS` to *flags* and yields.  If the block returns a falsy value,
`$CFLAGS` is reset to its previous value, remains set to *flags* otherwise.
## with_config(config , default nil) [](#method-c-with_config)
Tests for the presence of a `--with-`*config* or `--without-`*config* option. 
Returns `true` if the with option is given, `false` if the without option is
given, and the default value otherwise.

This can be useful for adding custom definitions, such as debug information.

Example:

    if with_config("debug")
       $defs.push("-DOSSL_DEBUG") unless $defs.include? "-DOSSL_DEBUG"
    end
## with_cppflags(flags ) [](#method-c-with_cppflags)
Sets `$CPPFLAGS` to *flags* and yields.  If the block returns a falsy value,
`$CPPFLAGS` is reset to its previous value, remains set to *flags* otherwise.

`flags`
:   a C preprocessor flag as a `String`

## with_destdir(dir ) [](#method-c-with_destdir)
:stopdoc:
## with_ldflags(flags ) [](#method-c-with_ldflags)
Sets `$LDFLAGS` to *flags* and yields.  If the block returns a falsy value,
`$LDFLAGS` is reset to its previous value, remains set to *flags* otherwise.
## with_werror(opt , opts nil) [](#method-c-with_werror)
**@yield** [opt, opts] 

## xpopen(command , *mode , &block ) [](#method-c-xpopen)
Executes *command* similarly to xsystem, but yields opened pipe.
## xsystem(command , werror: false) [](#method-c-xsystem)
call-seq:
    xsystem(command, werror: false)   -> true or false

Executes *command* with expanding variables, and returns the exit status like
as Kernel#system.  If *werror* is true and the error output is not empty,
returns `false`.  The output will logged.

#Instance Methods
## append_cflags(flags, **opts) [](#method-i-append_cflags)
Check whether each given C compiler flag is acceptable and append it to
`$CFLAGS` if so.

`flags`
:   a C compiler flag as a `String` or an `Array` of them


## append_cppflags(flags, **opts) [](#method-i-append_cppflags)
Check whether each given C preprocessor flag is acceptable and append it to
`$CPPFLAGS` if so.

`flags`
:   a C preprocessor flag as a `String` or an `Array` of them


## append_ldflags(flags, **opts) [](#method-i-append_ldflags)
Check whether each given linker flag is acceptable and append it to `$LDFLAGS`
if so.

`flags`
:   a linker flag as a `String` or an `Array` of them


## append_library(libs, lib) [](#method-i-append_library)
:no-doc:

## arg_config(config, defaultnil, &block) [](#method-i-arg_config)
:stopdoc:

## cc_command(opt"") [](#method-i-cc_command)

## cc_config(opt"") [](#method-i-cc_config)

## check_signedness(type, headersnil, optsnil, &b) [](#method-i-check_signedness)
Returns the signedness of the given `type`.  You may optionally specify
additional `headers` to search in for the `type`.

If the `type` is found and is a numeric type, a macro is passed as a
preprocessor constant to the compiler using the `type` name, in uppercase,
prepended with `SIGNEDNESS_OF_`, followed by the `type` name, followed by `=X`
where "X" is positive integer if the `type` is unsigned and a negative integer
if the `type` is signed.

For example, if `size_t` is defined as unsigned, then
`check_signedness('size_t')` would return +1 and the `SIGNEDNESS_OF_SIZE_T=+1`
preprocessor macro would be passed to the compiler.  The
`SIGNEDNESS_OF_INT=-1` macro would be set for `check_signedness('int')`

## check_sizeof(type, headersnil, opts"", &b) [](#method-i-check_sizeof)
Returns the size of the given `type`.  You may optionally specify additional
`headers` to search in for the `type`.

If found, a macro is passed as a preprocessor constant to the compiler using
the type name, in uppercase, prepended with `SIZEOF_`, followed by the type
name, followed by `=X` where "X" is the actual size.

For example, if `check_sizeof('mystruct')` returned 12, then the
`SIZEOF_MYSTRUCT=12` preprocessor macro would be passed to the compiler.

## checking_for(m, fmtnil) [](#method-i-checking_for)
This emits a string to stdout that allows users to see the results of the
various have* and find* methods as they are tested.

Internal use only.

## checking_message(target, placenil, optnil) [](#method-i-checking_message)
Build a message for checking.

Internal use only.

## configuration(srcdir) [](#method-i-configuration)

## conftest_source() [](#method-i-conftest_source)
Returns the language-dependent source file name for configuration checks.

## convertible_int(type, headersnil, optsnil, &b) [](#method-i-convertible_int)
Returns the convertible integer type of the given `type`.  You may optionally
specify additional `headers` to search in for the `type`. *convertible* means
actually the same type, or typedef'd from the same type.

If the `type` is an integer type and the *convertible* type is found, the
following macros are passed as preprocessor constants to the compiler using
the `type` name, in uppercase.

*   `TYPEOF_`, followed by the `type` name, followed by `=X` where "X" is the
    found *convertible* type name.
*   `TYP2NUM` and `NUM2TYP`, where `TYP` is the `type` name in uppercase with
    replacing an `_t` suffix with "T", followed by `=X` where "X" is the macro
    name to convert `type` to an Integer object, and vice versa.

For example, if `foobar_t` is defined as unsigned long, then
`convertible_int("foobar_t")` would return "unsigned long", and define these
macros:

    #define TYPEOF_FOOBAR_T unsigned long
    #define FOOBART2NUM ULONG2NUM
    #define NUM2FOOBART NUM2ULONG

## cpp_command(outfile, opt"") [](#method-i-cpp_command)

## cpp_include(header) [](#method-i-cpp_include)

## create_header(header"extconf.h") [](#method-i-create_header)
Generates a header file consisting of the various macro definitions generated
by other methods such as have_func and have_header. These are then wrapped in
a custom `#ifndef` based on the `header` file name, which defaults to
"extconf.h".

For example:

    # extconf.rb
    require 'mkmf'
    have_func('realpath')
    have_header('sys/utime.h')
    create_header
    create_makefile('foo')

The above script would generate the following extconf.h file:

    #ifndef EXTCONF_H
    #define EXTCONF_H
    #define HAVE_REALPATH 1
    #define HAVE_SYS_UTIME_H 1
    #endif

Given that the create_header method generates a file based on definitions set
earlier in your extconf.rb file, you will probably want to make this one of
the last methods you call in your script.

## create_makefile(target, srcprefixnil) [](#method-i-create_makefile)
Generates the Makefile for your extension, passing along any options and
preprocessor constants that you may have generated through other methods.

The `target` name should correspond the name of the global function name
defined within your C extension, minus the `Init_`.  For example, if your C
extension is defined as `Init_foo`, then your target would simply be "foo".

If any "/" characters are present in the target name, only the last name is
interpreted as the target name, and the rest are considered toplevel directory
names, and the generated Makefile will be altered accordingly to follow that
directory structure.

For example, if you pass "test/foo" as a target name, your extension will be
installed under the "test" directory.  This means that in order to load the
file within a Ruby program later, that directory structure will have to be
followed, e.g. `require 'test/foo'`.

The `srcprefix` should be used when your source files are not in the same
directory as your build script. This will not only eliminate the need for you
to manually copy the source files into the same directory as your build
script, but it also sets the proper `target_prefix` in the generated Makefile.

Setting the `target_prefix` will, in turn, install the generated binary in a
directory under your `RbConfig::CONFIG['sitearchdir']` that mimics your local
filesystem when you run `make install`.

For example, given the following file tree:

    ext/
      extconf.rb
      test/
        foo.c

And given the following code:

    create_makefile('test/foo', 'test')

That will set the `target_prefix` in the generated Makefile to "test". That,
in turn, will create the following file tree when installed via the `make
install` command:

    /path/to/ruby/sitearchdir/test/foo.so

It is recommended that you use this approach to generate your makefiles,
instead of copying files around manually, because some third party libraries
may depend on the `target_prefix` being set properly.

The `srcprefix` argument can be used to override the default source directory,
i.e. the current directory.  It is included as part of the `VPATH` and added
to the list of `INCFLAGS`.

## create_tmpsrc(src) [](#method-i-create_tmpsrc)
Creats temporary source file from `COMMON_HEADERS` and *src*. Yields the
created source string and uses the returned string as the source code, if the
block is given.

## depend_rules(depend) [](#method-i-depend_rules)
Processes the data contents of the "depend" file.  Each line of this file is
expected to be a file name.

Returns the output of findings, in Makefile format.

## dir_config(target, idefaultnil, ldefaultnil) [](#method-i-dir_config)
call-seq:
    dir_config(target)
    dir_config(target, prefix)
    dir_config(target, idefault, ldefault)

Sets a `target` name that the user can then use to configure various "with"
options with on the command line by using that name.  For example, if the
target is set to "foo", then the user could use the `--with-foo-dir=prefix`,
`--with-foo-include=dir` and `--with-foo-lib=dir` command line options to tell
where to search for header/library files.

You may pass along additional parameters to specify default values.  If one is
given it is taken as default `prefix`, and if two are given they are taken as
"include" and "lib" defaults in that order.

In any case, the return value will be an array of determined "include" and
"lib" directories, either of which can be nil if no corresponding command line
option is given when no default value is specified.

Note that dir_config only adds to the list of places to search for libraries
and include files.  It does not link the libraries into your application.

## dummy_makefile(srcdir) [](#method-i-dummy_makefile)
Creates a stub Makefile.

## each_compile_rules() [](#method-i-each_compile_rules)
:nodoc:

## egrep_cpp(pat, src, opt"", &b) [](#method-i-egrep_cpp)
Returns whether or not the `src` can be preprocessed with the C preprocessor
and matches with `pat`.

If a block given, it is called with the source before compilation. You can
modify the source in the block.

`pat`
:   a Regexp or a String

`src`
:   a String which contains a C source

`opt`
:   a String which contains preprocessor options


NOTE: When pat is a Regexp the matching will be checked in process, otherwise
egrep(1) will be invoked to check it.

## enable_config(config, defaultnil) [](#method-i-enable_config)
Tests for the presence of an `--enable-`*config* or `--disable-`*config*
option. Returns `true` if the enable option is given, `false` if the disable
option is given, and the default value otherwise.

This can be useful for adding custom definitions, such as debug information.

Example:

    if enable_config("debug")
       $defs.push("-DOSSL_DEBUG") unless $defs.include? "-DOSSL_DEBUG"
    end

## env_quote(envs) [](#method-i-env_quote)

## expand_command(commands, envslibpath_env) [](#method-i-expand_command)

## find_executable(bin, pathnil) [](#method-i-find_executable)
Searches for the executable `bin` on `path`.  The default path is your `PATH`
environment variable. If that isn't defined, it will resort to searching
/usr/local/bin, /usr/ucb, /usr/bin and /bin.

If found, it will return the full path, including the executable name, of
where it was found.

Note that this method does not actually affect the generated Makefile.

## find_executable0(bin, pathnil) [](#method-i-find_executable0)
:nodoc:

This method is used internally by the find_executable method.

Internal use only.

## find_header(header, *paths) [](#method-i-find_header)
Instructs mkmf to search for the given `header` in any of the `paths`
provided, and returns whether or not it was found in those paths.

If the header is found then the path it was found on is added to the list of
included directories that are sent to the compiler (via the `-I` switch).

## find_library(lib, func, *paths, &b) [](#method-i-find_library)
Returns whether or not the entry point `func` can be found within the library
`lib` in one of the `paths` specified, where `paths` is an array of strings. 
If `func` is `nil` , then the `main()` function is used as the entry point.

If `lib` is found, then the path it was found on is added to the list of
library paths searched and linked against.

## find_type(type, opt, *headers, &b) [](#method-i-find_type)
Returns where the static type `type` is defined.

You may also pass additional flags to `opt` which are then passed along to the
compiler.

See also `have_type`.

## have_const(const, headersnil, opt"", &b) [](#method-i-have_const)
Returns whether or not the constant `const` is defined.  You may optionally
pass the `type` of `const` as `[const, type]`, such as:

    have_const(%w[PTHREAD_MUTEX_INITIALIZER pthread_mutex_t], "pthread.h")

You may also pass additional `headers` to check against in addition to the
common header files, and additional flags to `opt` which are then passed along
to the compiler.

If found, a macro is passed as a preprocessor constant to the compiler using
the type name, in uppercase, prepended with `HAVE_CONST_`.

For example, if `have_const('foo')` returned true, then the `HAVE_CONST_FOO`
preprocessor macro would be passed to the compiler.

## have_devel?() [](#method-i-have_devel?)
:stopdoc:

**@return** [Boolean] 

## have_framework(fw, &b) [](#method-i-have_framework)
Returns whether or not the given `framework` can be found on your system. If
found, a macro is passed as a preprocessor constant to the compiler using the
framework name, in uppercase, prepended with `HAVE_FRAMEWORK_`.

For example, if `have_framework('Ruby')` returned true, then the
`HAVE_FRAMEWORK_RUBY` preprocessor macro would be passed to the compiler.

If `fw` is a pair of the framework name and its header file name that header
file is checked, instead of the normally used header file which is named same
as the framework.

## have_func(func, headersnil, opt"", &b) [](#method-i-have_func)
Returns whether or not the function `func` can be found in the common header
files, or within any `headers` that you provide.  If found, a macro is passed
as a preprocessor constant to the compiler using the function name, in
uppercase, prepended with `HAVE_`.

To check functions in an additional library, you need to check that library
first using `have_library()`.  The `func` shall be either mere function name
or function name with arguments.

For example, if `have_func('foo')` returned `true`, then the `HAVE_FOO`
preprocessor macro would be passed to the compiler.

## have_header(header, preheadersnil, opt"", &b) [](#method-i-have_header)
Returns whether or not the given `header` file can be found on your system. If
found, a macro is passed as a preprocessor constant to the compiler using the
header file name, in uppercase, prepended with `HAVE_`.

For example, if `have_header('foo.h')` returned true, then the `HAVE_FOO_H`
preprocessor macro would be passed to the compiler.

## have_library(lib, funcnil, headersnil, opt"", &b) [](#method-i-have_library)
Returns whether or not the given entry point `func` can be found within `lib`.
 If `func` is `nil`, the `main()` entry point is used by default.  If found,
it adds the library to list of libraries to be used when linking your
extension.

If `headers` are provided, it will include those header files as the header
files it looks in when searching for `func`.

The real name of the library to be linked can be altered by `--with-FOOlib`
configuration option.

## have_macro(macro, headersnil, opt"", &b) [](#method-i-have_macro)
Returns whether or not `macro` is defined either in the common header files or
within any `headers` you provide.

Any options you pass to `opt` are passed along to the compiler.

## have_struct_member(type, member, headersnil, opt"", &b) [](#method-i-have_struct_member)
Returns whether or not the struct of type `type` contains `member`.  If it
does not, or the struct type can't be found, then false is returned. You may
optionally specify additional `headers` in which to look for the struct (in
addition to the common header files).

If found, a macro is passed as a preprocessor constant to the compiler using
the type name and the member name, in uppercase, prepended with `HAVE_`.

For example, if `have_struct_member('struct foo', 'bar')` returned true, then
the `HAVE_STRUCT_FOO_BAR` preprocessor macro would be passed to the compiler.

`HAVE_ST_BAR` is also defined for backward compatibility.

## have_type(type, headersnil, opt"", &b) [](#method-i-have_type)
Returns whether or not the static type `type` is defined.  You may optionally
pass additional `headers` to check against in addition to the common header
files.

You may also pass additional flags to `opt` which are then passed along to the
compiler.

If found, a macro is passed as a preprocessor constant to the compiler using
the type name, in uppercase, prepended with `HAVE_TYPE_`.

For example, if `have_type('foo')` returned true, then the `HAVE_TYPE_FOO`
preprocessor macro would be passed to the compiler.

## have_typeof?() [](#method-i-have_typeof?)
Used internally by the what_type? method to check if the *typeof* GCC
extension is available.

**@return** [Boolean] 

## have_var(var, headersnil, opt"", &b) [](#method-i-have_var)
Returns whether or not the variable `var` can be found in the common header
files, or within any `headers` that you provide.  If found, a macro is passed
as a preprocessor constant to the compiler using the variable name, in
uppercase, prepended with `HAVE_`.

To check variables in an additional library, you need to check that library
first using `have_library()`.

For example, if `have_var('foo')` returned true, then the `HAVE_FOO`
preprocessor macro would be passed to the compiler.

## init_mkmf(configCONFIG, rbconfigRbConfig::CONFIG) [](#method-i-init_mkmf)
:stopdoc:

## install_dirs(target_prefixnil) [](#method-i-install_dirs)

## install_files(mfile, ifiles, mapnil, srcprefixnil) [](#method-i-install_files)

## install_rb(mfile, dest, srcdirnil) [](#method-i-install_rb)

## libpath_env() [](#method-i-libpath_env)

## libpathflag(libpath$DEFLIBPATH|$LIBPATH) [](#method-i-libpathflag)

## link_command(ldflags, *opts) [](#method-i-link_command)

## link_config(ldflags, opt"", libpath$DEFLIBPATH|$LIBPATH) [](#method-i-link_config)

## log_src(src, heading"checked program was") [](#method-i-log_src)
Logs *src*

## macro_defined?(macro, src, opt"", &b) [](#method-i-macro_defined?)
This is used internally by the have_macro? method.

**@return** [Boolean] 

## map_dir(dir, mapnil) [](#method-i-map_dir)

## merge_libs(*libs) [](#method-i-merge_libs)

## message(*s) [](#method-i-message)
Prints messages to $stdout, if verbose mode.

Internal use only.

## mkintpath(path) [](#method-i-mkintpath)

## mkmf_failed(path) [](#method-i-mkmf_failed)
Returns whether or not the Makefile was successfully generated. If not, the
script will abort with an error message.

Internal use only.

## modified?(target, times) [](#method-i-modified?)
Returns time stamp of the `target` file if it exists and is newer than or
equal to all of `times`.

**@return** [Boolean] 

## pkg_config(pkg, *options) [](#method-i-pkg_config)
Returns compile/link information about an installed library in a tuple of
`[cflags, ldflags, libs]`, by using the command found first in the following
commands:

1.  If `--with-{pkg}-config={command}` is given via command line option:
    `{command} {options}`

2.  `{pkg}-config {options}`

3.  `pkg-config {options} {pkg}`

Where `options` is the option name without dashes, for instance `"cflags"` for
the `--cflags` flag.

The values obtained are appended to `$INCFLAGS`, `$CFLAGS`, `$LDFLAGS` and
`$libs`.

If one or more `options` argument is given, the config command is invoked with
the options and a stripped output string is returned without modifying any of
the global values mentioned above.

## relative_from(path, base) [](#method-i-relative_from)

## scalar_ptr_type?(type, membernil, headersnil, &b) [](#method-i-scalar_ptr_type?)
Used internally by the what_type? method to determine if `type` is a scalar
pointer.

**@return** [Boolean] 

## scalar_type?(type, membernil, headersnil, &b) [](#method-i-scalar_type?)
Used internally by the what_type? method to determine if `type` is a scalar
pointer.

**@return** [Boolean] 

## split_libs(*strs) [](#method-i-split_libs)
:stopdoc:

## timestamp_file(name, target_prefixnil) [](#method-i-timestamp_file)

## try_cflags(flags, werror:true, **opts) [](#method-i-try_cflags)
:nodoc:

## try_compile(src, opt"", werror:nil, **opts, &b) [](#method-i-try_compile)
Returns whether or not the `src` can be compiled as a C source.  `opt` is
passed to the C compiler as options. Note that `$CFLAGS` is also passed to the
compiler.

If a block given, it is called with the source before compilation. You can
modify the source in the block.

`src`
:   a String which contains a C source

`opt`
:   a String which contains compiler options


## try_const(const, headersnil, opt"", &b) [](#method-i-try_const)
:nodoc: Returns whether or not the constant `const` is defined.

See also `have_const`

## try_constant(const, headersnil, opt"", &b) [](#method-i-try_constant)

## try_cpp(src, opt"", **opts, &b) [](#method-i-try_cpp)
Returns whether or not the `src` can be preprocessed with the C preprocessor. 
`opt` is passed to the preprocessor as options. Note that `$CFLAGS` is also
passed to the preprocessor.

If a block given, it is called with the source before preprocessing. You can
modify the source in the block.

`src`
:   a String which contains a C source

`opt`
:   a String which contains preprocessor options


## try_cppflags(flags, werror:true, **opts) [](#method-i-try_cppflags)
:nodoc:

## try_do(src, command, **opts, &b) [](#method-i-try_do)

## try_func(func, libs, headersnil, opt"", &b) [](#method-i-try_func)
You should use `have_func` rather than `try_func`.

`func`
:   a String which contains a symbol name

`libs`
:   a String which contains library names.

`headers`
:   a String or an Array of strings which contains names of header files.


## try_ldflags(flags, werror:$mswin, **opts) [](#method-i-try_ldflags)
:nodoc:

## try_link(src, opt"", **opts, &b) [](#method-i-try_link)
Returns whether or not the `src` can be compiled as a C source and linked with
its depending libraries successfully.  `opt` is passed to the linker as
options. Note that `$CFLAGS` and `$LDFLAGS` are also passed to the linker.

If a block given, it is called with the source before compilation. You can
modify the source in the block.

`src`
:   a String which contains a C source

`opt`
:   a String which contains linker options


## try_link0(src, opt"", ldflags:"", **opts, &b) [](#method-i-try_link0)
:nodoc:

## try_run(src, opt"", &b) [](#method-i-try_run)
Returns whether or not:
*   the `src` can be compiled as a C source,
*   the result object can be linked with its depending libraries successfully,
*   the linked file can be invoked as an executable
*   and the executable exits successfully

`opt` is passed to the linker as options. Note that `$CFLAGS` and `$LDFLAGS`
are also passed to the linker.

If a block given, it is called with the source before compilation. You can
modify the source in the block.

`src`
:   a String which contains a C source

`opt`
:   a String which contains linker options


Returns true when the executable exits successfully, false when it fails, or
nil when preprocessing, compilation or link fails.

## try_signedness(type, member, headersnil, optsnil) [](#method-i-try_signedness)

**@raise** [ArgumentError] 

## try_static_assert(expr, headersnil, opt"", &b) [](#method-i-try_static_assert)
:stopdoc:

## try_type(type, headersnil, opt"", &b) [](#method-i-try_type)
:nodoc: Returns whether or not the static type `type` is defined.

See also `have_type`

## try_var(var, headersnil, opt"", &b) [](#method-i-try_var)
You should use `have_var` rather than `try_var`.

## typedef_expr(type, headers) [](#method-i-typedef_expr)

## werror_flag(optnil) [](#method-i-werror_flag)

## what_type?(type, membernil, headersnil, &b) [](#method-i-what_type?)
Returns a string represents the type of *type*, or *member* of *type* if
*member* is not `nil`.

**@return** [Boolean] 

## winsep(s) [](#method-i-winsep)
Converts forward slashes to backslashes. Aimed at MS Windows.

Internal use only.

## with_cflags(flags) [](#method-i-with_cflags)
Sets `$CFLAGS` to *flags* and yields.  If the block returns a falsy value,
`$CFLAGS` is reset to its previous value, remains set to *flags* otherwise.

## with_config(config, defaultnil) [](#method-i-with_config)
Tests for the presence of a `--with-`*config* or `--without-`*config* option. 
Returns `true` if the with option is given, `false` if the without option is
given, and the default value otherwise.

This can be useful for adding custom definitions, such as debug information.

Example:

    if with_config("debug")
       $defs.push("-DOSSL_DEBUG") unless $defs.include? "-DOSSL_DEBUG"
    end

## with_cppflags(flags) [](#method-i-with_cppflags)
Sets `$CPPFLAGS` to *flags* and yields.  If the block returns a falsy value,
`$CPPFLAGS` is reset to its previous value, remains set to *flags* otherwise.

`flags`
:   a C preprocessor flag as a `String`


## with_destdir(dir) [](#method-i-with_destdir)
:stopdoc:

## with_ldflags(flags) [](#method-i-with_ldflags)
Sets `$LDFLAGS` to *flags* and yields.  If the block returns a falsy value,
`$LDFLAGS` is reset to its previous value, remains set to *flags* otherwise.

## with_werror(opt, optsnil) [](#method-i-with_werror)

**@yield** [opt, opts] 

## xpopen(command, *mode, &block) [](#method-i-xpopen)
Executes *command* similarly to xsystem, but yields opened pipe.

## xsystem(command, werror:false) [](#method-i-xsystem)
call-seq:
    xsystem(command, werror: false)   -> true or false

Executes *command* with expanding variables, and returns the exit status like
as Kernel#system.  If *werror* is true and the error output is not empty,
returns `false`.  The output will logged.

