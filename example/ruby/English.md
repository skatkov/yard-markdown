# Module: English
    

Include the English library file in a Ruby script, and you can
    reference the global variables such as <code>$_</code> using less
    cryptic names, listed below.

    Without 'English':

        $\ = ' -- '
        "waterbuffalo" =~ /buff/
        print $', $$, "\n"

    With English:

        require "English"

        $OUTPUT_FIELD_SEPARATOR = ' -- '
        "waterbuffalo" =~ /buff/
        print $POSTMATCH, $PID, "\n"

    Below is a full list of descriptive aliases and their associated global
    variable:

    $ERROR_INFO::              $!
    $ERROR_POSITION::          $@
    $FS::                      $;
    $FIELD_SEPARATOR::         $;
    $OFS::                     $,
    $OUTPUT_FIELD_SEPARATOR::  $,
    $RS::                      $/
    $INPUT_RECORD_SEPARATOR::  $/
    $ORS::                     $\
    $OUTPUT_RECORD_SEPARATOR:: $\
    $INPUT_LINE_NUMBER::       $.
    $NR::                      $.
    $LAST_READ_LINE::          $_
    $DEFAULT_OUTPUT::          $>
    $DEFAULT_INPUT::           $<
    $PID::                     $$
    $PROCESS_ID::              $$
    $CHILD_STATUS::            $?
    $LAST_MATCH_INFO::         $~
    $ARGV::                    $*
    $MATCH::                   $&
    $PREMATCH::                $`
    $POSTMATCH::               $'
    $LAST_PAREN_MATCH::        $+



