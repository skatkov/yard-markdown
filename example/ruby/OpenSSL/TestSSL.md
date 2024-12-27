# Class: OpenSSL::TestSSL
**Inherits:** OpenSSL::SSLTestCase
    




#Instance Methods
## check_supported_protocol_versions() [](#method-i-check_supported_protocol_versions)

## create_cert_with_name(name) [](#method-i-create_cert_with_name)

## create_cert_with_san(san) [](#method-i-create_cert_with_san)

## create_null_byte_SAN_certificate(criticalfalse) [](#method-i-create_null_byte_SAN_certificate)
Create NULL byte SAN certificate

## readwrite_loop_safe(ctx, ssl) [](#method-i-readwrite_loop_safe)

## socketpair() [](#method-i-socketpair)

## test_accept_errors_include_peeraddr() [](#method-i-test_accept_errors_include_peeraddr)

## test_add_certificate() [](#method-i-test_add_certificate)

## test_add_certificate_multiple_certs() [](#method-i-test_add_certificate_multiple_certs)

## test_alpn_protocol_selection_ary() [](#method-i-test_alpn_protocol_selection_ary)

## test_alpn_protocol_selection_cancel() [](#method-i-test_alpn_protocol_selection_cancel)

## test_bad_socket() [](#method-i-test_bad_socket)

## test_ca_file() [](#method-i-test_ca_file)

## test_ca_file_not_found() [](#method-i-test_ca_file_not_found)

## test_ciphers_method_bogus_csuite() [](#method-i-test_ciphers_method_bogus_csuite)

## test_ciphers_method_frozen_object() [](#method-i-test_ciphers_method_frozen_object)

## test_ciphers_method_nil_argument() [](#method-i-test_ciphers_method_nil_argument)

## test_ciphers_method_tls_connection() [](#method-i-test_ciphers_method_tls_connection)

## test_ciphersuites_method_bogus_csuite() [](#method-i-test_ciphersuites_method_bogus_csuite)

## test_ciphersuites_method_frozen_object() [](#method-i-test_ciphersuites_method_frozen_object)

## test_ciphersuites_method_nil_argument() [](#method-i-test_ciphersuites_method_nil_argument)

## test_ciphersuites_method_tls_connection() [](#method-i-test_ciphersuites_method_tls_connection)

## test_client_auth_success() [](#method-i-test_client_auth_success)

## test_client_ca() [](#method-i-test_client_ca)

## test_client_cert_cb_ignore_error() [](#method-i-test_client_cert_cb_ignore_error)

## test_close_after_socket_close() [](#method-i-test_close_after_socket_close)

## test_connect_certificate_verify_failed_exception_message() [](#method-i-test_connect_certificate_verify_failed_exception_message)

## test_connect_works_when_setting_dh_callback_to_nil() [](#method-i-test_connect_works_when_setting_dh_callback_to_nil)

## test_copy_stream() [](#method-i-test_copy_stream)

## test_ctx_options() [](#method-i-test_ctx_options)

## test_ctx_options_config() [](#method-i-test_ctx_options_config)

## test_ctx_setup() [](#method-i-test_ctx_setup)

## test_dup() [](#method-i-test_dup)

## test_ecdh_curves_tls12() [](#method-i-test_ecdh_curves_tls12)

## test_ecdh_curves_tls13() [](#method-i-test_ecdh_curves_tls13)

## test_exception_in_verify_callback_is_ignored() [](#method-i-test_exception_in_verify_callback_is_ignored)

## test_export_keying_material() [](#method-i-test_export_keying_material)

## test_fallback_scsv() [](#method-i-test_fallback_scsv)

## test_fileno() [](#method-i-test_fileno)

## test_finished_messages() [](#method-i-test_finished_messages)

## test_freeze_calls_setup() [](#method-i-test_freeze_calls_setup)

## test_get_ephemeral_key() [](#method-i-test_get_ephemeral_key)

## test_getbyte() [](#method-i-test_getbyte)

## test_keylog_cb() [](#method-i-test_keylog_cb)

## test_minmax_version() [](#method-i-test_minmax_version)

## test_npn_advertised_protocol_too_long() [](#method-i-test_npn_advertised_protocol_too_long)

## test_npn_protocol_selection_ary() [](#method-i-test_npn_protocol_selection_ary)

## test_npn_protocol_selection_cancel() [](#method-i-test_npn_protocol_selection_cancel)

## test_npn_protocol_selection_enum() [](#method-i-test_npn_protocol_selection_enum)

## test_npn_selected_protocol_too_long() [](#method-i-test_npn_selected_protocol_too_long)

## test_options_disable_versions() [](#method-i-test_options_disable_versions)

## test_parallel() [](#method-i-test_parallel)

## test_post_connect_check_with_anon_ciphers() [](#method-i-test_post_connect_check_with_anon_ciphers)

## test_post_connection_check() [](#method-i-test_post_connection_check)

## test_post_connection_check_wildcard_cn() [](#method-i-test_post_connection_check_wildcard_cn)

## test_post_connection_check_wildcard_san() [](#method-i-test_post_connection_check_wildcard_san)
Comments in this test is excerpted from
https://www.rfc-editor.org/rfc/rfc6125#page-27

## test_read_with_timeout() [](#method-i-test_read_with_timeout)

## test_readbyte() [](#method-i-test_readbyte)

## test_renegotiation_cb() [](#method-i-test_renegotiation_cb)

## test_security_level() [](#method-i-test_security_level)

## test_servername_cb_raises_an_exception_on_unknown_objects() [](#method-i-test_servername_cb_raises_an_exception_on_unknown_objects)

## test_set_params_min_version() [](#method-i-test_set_params_min_version)

## test_socket_close_write() [](#method-i-test_socket_close_write)

## test_socket_open() [](#method-i-test_socket_open)

## test_socket_open_with_context() [](#method-i-test_socket_open_with_context)

## test_socket_open_with_local_address_port_context() [](#method-i-test_socket_open_with_local_address_port_context)

## test_ssl_methods_constant() [](#method-i-test_ssl_methods_constant)

## test_ssl_with_server_cert() [](#method-i-test_ssl_with_server_cert)

## test_sslctx_set_params() [](#method-i-test_sslctx_set_params)

## test_sync_close() [](#method-i-test_sync_close)

## test_sync_close_without_connect() [](#method-i-test_sync_close_without_connect)

## test_sysread_and_syswrite() [](#method-i-test_sysread_and_syswrite)

## test_tlsext_hostname() [](#method-i-test_tlsext_hostname)

## test_tmp_dh() [](#method-i-test_tmp_dh)

## test_tmp_dh_callback() [](#method-i-test_tmp_dh_callback)

## test_unset_OP_ALL() [](#method-i-test_unset_OP_ALL)

## test_unstarted_session() [](#method-i-test_unstarted_session)

## test_verify_certificate_identity() [](#method-i-test_verify_certificate_identity)

## test_verify_hostname() [](#method-i-test_verify_hostname)

## test_verify_hostname_failure_error_code() [](#method-i-test_verify_hostname_failure_error_code)

## test_verify_hostname_on_connect() [](#method-i-test_verify_hostname_on_connect)

## test_verify_mode_client_cert_required() [](#method-i-test_verify_mode_client_cert_required)

## test_verify_mode_default() [](#method-i-test_verify_mode_default)

## test_verify_mode_server_cert() [](#method-i-test_verify_mode_server_cert)

## test_verify_result() [](#method-i-test_verify_result)

## test_verify_wildcard() [](#method-i-test_verify_wildcard)

