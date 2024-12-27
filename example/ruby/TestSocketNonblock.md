# Class: TestSocketNonblock
**Inherits:** Test::Unit::TestCase
    




#Instance Methods
## tcp_pair() [](#method-i-tcp_pair)

## test_accept_nonblock() [](#method-i-test_accept_nonblock)

## test_accept_nonblock_error() [](#method-i-test_accept_nonblock_error)

## test_connect_nonblock() [](#method-i-test_connect_nonblock)

## test_connect_nonblock_error() [](#method-i-test_connect_nonblock_error)

## test_connect_nonblock_no_exception() [](#method-i-test_connect_nonblock_no_exception)

## test_read_nonblock() [](#method-i-test_read_nonblock)

## test_read_nonblock_no_exception() [](#method-i-test_read_nonblock_no_exception)

## test_recv_nonblock_error() [](#method-i-test_recv_nonblock_error)

## test_recv_nonblock_no_exception() [](#method-i-test_recv_nonblock_no_exception)

## test_recvfrom_nonblock_no_exception() [](#method-i-test_recvfrom_nonblock_no_exception)

## test_recvmsg_nonblock_error() [](#method-i-test_recvmsg_nonblock_error)

## test_sendmsg_nonblock_error() [](#method-i-test_sendmsg_nonblock_error)
def test_write_nonblock
      c, s = tcp_pair
      str = "a" * 10000
      _, ws, _ = IO.select(nil, [c], nil)
      assert_equal([c], ws)
      ret = c.write_nonblock(str)
      assert_operator(ret, :>, 0)
      loop {
        assert_raise(IO::WaitWritable) {
          loop {
            ret = c.write_nonblock(str)
            assert_operator(ret, :>, 0)
          }
        }
        _, ws, _ = IO.select(nil, [c], nil, 0)
        break if !ws
      }
    ensure
      c.close if c
      s.close if s
    end

## test_sendmsg_nonblock_no_exception() [](#method-i-test_sendmsg_nonblock_no_exception)

## test_sendmsg_nonblock_seqpacket() [](#method-i-test_sendmsg_nonblock_seqpacket)

## test_socket_recvfrom_nonblock() [](#method-i-test_socket_recvfrom_nonblock)

## test_tcp_recv_nonblock() [](#method-i-test_tcp_recv_nonblock)

## test_udp_recv_nonblock() [](#method-i-test_udp_recv_nonblock)

## test_udp_recvfrom_nonblock() [](#method-i-test_udp_recvfrom_nonblock)

## udp_pair() [](#method-i-udp_pair)

