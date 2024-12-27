# Module: IRB::Color
    



# Class Methods
## clear(colorable: colorable?)
) [](#method-c-clear)
## colorable?() [](#method-c-colorable?)
**@return** [Boolean] 

## colorize(text , seq , colorable: colorable?)
) [](#method-c-colorize)
## colorize_code(code , complete: true, ignore_error: false, colorable: colorable?, , local_variables: []) [](#method-c-colorize_code)
If `complete` is false (code is incomplete), this does not warn compile_error.
This option is needed to avoid warning a user when the compile_error is
happening because the input is not wrong but just incomplete.
## inspect_colorable?(obj , seen: {}.compare_by_identity) [](#method-c-inspect_colorable?)
**@return** [Boolean] 


