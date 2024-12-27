# Class: NetFTPSpecs::DummyFTP
**Inherits:** Object
    



# Attributes
## connect_message[RW] [](#attribute-i-connect_message)
Returns the value of attribute connect_message.

## hostname[RW] [](#attribute-i-hostname)
hostname or IP address

## login_acct[RW] [](#attribute-i-login_acct)
Returns the value of attribute login_acct.

## login_pass[RW] [](#attribute-i-login_pass)
Returns the value of attribute login_pass.

## login_user[RW] [](#attribute-i-login_user)
Returns the value of attribute login_user.

## server_port[RW] [](#attribute-i-server_port)
port number


#Instance Methods
## abor() [](#method-i-abor)
FTP methods

## acct(account) [](#method-i-acct)

## and_respond(text) [](#method-i-and_respond)

## appe(file) [](#method-i-appe)

## cdup() [](#method-i-cdup)

## cwd(dir) [](#method-i-cwd)

## dele(file) [](#method-i-dele)

## eprt(arg) [](#method-i-eprt)

## error_response(text) [](#method-i-error_response)

## handle(sym, &block) [](#method-i-handle)

## handle_request() [](#method-i-handle_request)

## help(param:default) [](#method-i-help)

## initialize() [](#method-i-initialize)

**@return** [DummyFTP] a new instance of DummyFTP

## list(folder) [](#method-i-list)

## mdtm(filename) [](#method-i-mdtm)

## mkd(foldername) [](#method-i-mkd)

## nlst(foldernil) [](#method-i-nlst)

## noop() [](#method-i-noop)

## pass(password) [](#method-i-pass)

## port(arg) [](#method-i-port)

## pwd() [](#method-i-pwd)

## response(text) [](#method-i-response)

## rest(at_bytes) [](#method-i-rest)

## retr(file) [](#method-i-retr)

## rmd(folder) [](#method-i-rmd)

## rnfr(from) [](#method-i-rnfr)

## rnto(to) [](#method-i-rnto)

## serve_once() [](#method-i-serve_once)

## should_receive(method) [](#method-i-should_receive)

## site(param) [](#method-i-site)

## size(filename) [](#method-i-size)

## stat(param:default) [](#method-i-stat)

## stop() [](#method-i-stop)

## stor(file) [](#method-i-stor)

## syst() [](#method-i-syst)

## type(type) [](#method-i-type)

## user(name) [](#method-i-user)

