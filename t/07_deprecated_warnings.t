#!/usr/bin/perl
#
# $Id$
#

BEGIN {
    use Test::More;
    eval "use Test::Warn";
    plan skip_all => "Test::Warn required for testing deprecation warnings"
        if $@;
    our $tests = 12;
    eval "use Test::NoWarnings";
    $tests++ unless( $@ );
    plan tests => $tests;
    chdir 't' if -d 't';
    use lib '../lib', '../blib/lib';
}

use Test::NoBreakpoints ':all';

# make sure our deprecated tests warn when they are used
warning_like { no_brkpts_ok('foo') }
    [ qw|deprecated| ],
    "no_brkpts_ok gives a deprecated warning";
warning_is { no_brkpts_ok('foo') }
    "no_brkpts_ok is deprecated (use no_breakpoints_ok instead)",
    "no_brkpts_ok deprecated warning matches expectations";
warning_like { all_files_no_brkpts_ok('foo') }
    [ qw|deprecated| ],
    "all_files_no_brkpts_ok gives a deprecated warning";
warning_is { all_files_no_brkpts_ok('foo') }
    "all_files_no_brkpts_ok is deprecated (use all_files_no_breakpoints_ok instead)",
    "all_files_no_brkpts_ok deprecated warning matches expectations";

# unless we disable deprecation warnings
{
    no warnings 'deprecated';

    warnings_are { no_brkpts_ok('foo') }
        [],
        "no_brkpts_ok gives no warnings if deprecated warnings " .
        "are disabled";

    warnings_are { all_files_no_brkpts_ok('foo') }
        [],
        "all_files_no_brkpts_ok gives no warnings if deprecated " .
        "warnings are disabled";
        
}

#
# EOF
