#!/usr/bin/perl
#
# $Id$
#

use strict;
use warnings;

no warnings 'deprecated';

BEGIN {
    use Test::Tester 0.09;
    use Test::More;
    our $tests = 17;
    eval "use Test::NoWarnings";
    $tests++ unless( $@ );
    plan tests => $tests;
    chdir 't' if -d 't';
    use lib '../lib', '../blib/lib';
}

use_ok('Test::NoBreakpoints');

# make sure the deprecated names of our tests are exported
ok( defined &no_brkpts_ok, "no_brkpts_ok defined");
ok( defined &all_files_no_brkpts_ok, "all_files_no_brkpts_ok defined");

# and that they indeed call the proper functions
check_test(
    sub { no_brkpts_ok('foo') },
    {
        ok   => 1,
        name => 'no breakpoint test of foo',
    },
    'no_brkpts_ok works like no_breakpoints_ok',
);
check_tests(
    sub { all_files_no_brkpts_ok( qw|./01_use.t ./02_pod.t ./04_all_perl_files.t| ) },
    [
        {
            ok   => 1,
            name => 'no breakpoint test of ./01_use.t',
        },
        {
            ok   => 1,
            name => 'no breakpoint test of ./02_pod.t',
        },
        {
            ok   => 1,
            name => 'no breakpoint test of ./04_all_perl_files.t',
        },
    ],
    'all_fils_no_brkpts_ok works like all_files_no_breakpoints_ok',
);

#
# EOF
