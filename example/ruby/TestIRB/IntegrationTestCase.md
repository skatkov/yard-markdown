# Class: TestIRB::IntegrationTestCase
**Inherits:** TestIRB::TestCase
    




#Instance Methods
## kill_safely(pid) [](#method-i-kill_safely)

## run_ruby_file(&block) [](#method-i-run_ruby_file)

## safe_gets(read) [](#method-i-safe_gets)
read.gets could raise exceptions on some platforms
https://github.com/ruby/ruby/blob/master/ext/pty/pty.c#L721-L728

## setup() [](#method-i-setup)

## teardown() [](#method-i-teardown)

## type(command) [](#method-i-type)

## wait_pid(pid, sec) [](#method-i-wait_pid)

## write_rc(content) [](#method-i-write_rc)

## write_ruby(program) [](#method-i-write_ruby)

