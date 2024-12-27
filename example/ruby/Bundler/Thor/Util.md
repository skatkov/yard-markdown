# Module: Bundler::Thor::Util
    

This module holds several utilities:

1) Methods to convert thor namespaces to constants and vice-versa.

    Bundler::Thor::Util.namespace_from_thor_class(Foo::Bar::Baz) #=> "foo:bar:baz"

2) Loading thor files and sandboxing:

    Bundler::Thor::Util.load_thorfile("~/.thor/foo")


# Class Methods
## camel_case(str ) [](#method-c-camel_case)
Receives a string and convert it to camel case. camel_case returns CamelCase.

#### Parameters
String

#### Returns
String
## escape_globs(path ) [](#method-c-escape_globs)
Returns a string that has had any glob characters escaped. The glob characters
are `* ? { } [ ]`.

#### Examples

    Bundler::Thor::Util.escape_globs('[apps]')   # => '\[apps\]'

#### Parameters
String

#### Returns
String
## escape_html(string ) [](#method-c-escape_html)
Returns a string that has had any HTML characters escaped.

#### Examples

    Bundler::Thor::Util.escape_html('<div>')   # => "&lt;div&gt;"

#### Parameters
String

#### Returns
String
## find_by_namespace(namespace ) [](#method-c-find_by_namespace)
Receives a namespace and search for it in the Bundler::Thor::Base subclasses.

#### Parameters
namespace<String>
:   The namespace to search for.

## find_class_and_command_by_namespace(namespace , fallback true) [](#method-c-find_class_and_command_by_namespace)
Receives a namespace and tries to retrieve a Bundler::Thor or
Bundler::Thor::Group class from it. It first searches for a class using the
all the given namespace, if it's not found, removes the highest entry and
searches for the class again. If found, returns the highest entry as the class
name.

#### Examples

    class Foo::Bar < Bundler::Thor
      def baz
      end
    end

    class Baz::Foo < Bundler::Thor::Group
    end

    Bundler::Thor::Util.namespace_to_thor_class("foo:bar")     #=> Foo::Bar, nil # will invoke default command
    Bundler::Thor::Util.namespace_to_thor_class("baz:foo")     #=> Baz::Foo, nil
    Bundler::Thor::Util.namespace_to_thor_class("foo:bar:baz") #=> Foo::Bar, "baz"

#### Parameters
namespace<String>
## globs_for(path ) [](#method-c-globs_for)
Where to look for Bundler::Thor files.
## load_thorfile(path , content nil, debug false) [](#method-c-load_thorfile)
Receives a path and load the thor file in the path. The file is evaluated
inside the sandbox to avoid namespacing conflicts.
## namespace_from_thor_class(constant ) [](#method-c-namespace_from_thor_class)
Receives a constant and converts it to a Bundler::Thor namespace. Since
Bundler::Thor commands can be added to a sandbox, this method is also
responsible for removing the sandbox namespace.

This method should not be used in general because it's used to deal with older
versions of Bundler::Thor. On current versions, if you need to get the
namespace from a class, just call namespace on it.

#### Parameters
constant<Object>
:   The constant to be converted to the thor path.


#### Returns
String
:   If we receive Foo::Bar::Baz it returns "foo:bar:baz"

## namespaces_in_content(contents , file __FILE__) [](#method-c-namespaces_in_content)
Given the contents, evaluate it inside the sandbox and returns the namespaces
defined in the sandbox.

#### Parameters
contents<String>

#### Returns
[Array](Object)
## ruby_command() [](#method-c-ruby_command)
Return the path to the ruby interpreter taking into account multiple
installations and windows extensions.
## snake_case(str ) [](#method-c-snake_case)
Receives a string and convert it to snake case. SnakeCase returns snake_case.

#### Parameters
String

#### Returns
String
## thor_classes_in(klass ) [](#method-c-thor_classes_in)
Returns the thor classes declared inside the given class.
## thor_root() [](#method-c-thor_root)
Returns the root where thor files are located, depending on the OS.
## thor_root_glob() [](#method-c-thor_root_glob)
Returns the files in the thor root. On Windows thor_root will be something
like this:

    C:\Documents and Settings\james\.thor

If we don't #gsub the \ character, Dir.glob will fail.
## user_home() [](#method-c-user_home)

