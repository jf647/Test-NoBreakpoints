#
# $Id$
#

BEGIN {
    use Test::Tester 0.09;
    use Test::More;
    our $tests = 37;
    eval "use Test::NoWarnings";
    $tests++ unless( $@ );
    plan tests => $tests;
    chdir 't' if -d 't';
    use lib '../lib', '../blib/lib';
}

use Test::NoBreakpoints ':all';

# test the tester for failure
check_tests(
    sub { all_files_no_breakpoints_ok( sort(all_perl_files('.')) ) },
    [
        {
            ok   => 1,
            depth => 2,
            name => 'no breakpoint test of ./01_use.t',
        },
        {
            ok   => 1,
            depth => 2,
            name => 'no breakpoint test of ./02_pod.t',
        },
        {
            ok   => 1,
            depth => 2,
            name => 'no breakpoint test of ./04_all_perl_files.t',
        },
        {
            ok   => 0,
            depth => 2,
            name => 'no breakpoint test of ./05_no_breakpoints_ok.t',
            diag => 'breakpoint found in ./05_no_breakpoints_ok.t: $DB::signal =1' . "\n",
        },
        {
            ok   => 0,
            depth => 2,
            name => 'no breakpoint test of ./06_all_files_no_breakpoints_ok.t',
            diag => 'breakpoint found in ./06_all_files_no_breakpoints_ok.t: $DB::signal =1' . "\n",
        },
        {
            ok   => 1,
            depth => 2,
            name => 'no breakpoint test of ./07_deprecated_warnings.t',
        },
        {
            ok   => 1,
            depth => 2,
            name => 'no breakpoint test of ./08_deprecated.t',
        },
        {
            ok   => 0,
            depth => 2,
            name => 'no breakpoint test of ./baz/foo.t',
            diag => 'breakpoint found in ./baz/foo.t: $DB::signal = 1' . "\n",
        },
        {
            ok   => 0,
            depth => 2,
            name => 'no breakpoint test of ./baz/gzonk/foo.pl',
            diag => 'breakpoint found in ./baz/gzonk/foo.pl: $DB::single = 2' . "\n",
        },
        {
            ok   => 1,
            depth => 2,
            name => 'no breakpoint test of ./baz/quux/Foo.pm',
        },
    ],
    'all_files_no_breakpoints_ok finds correct breakpoints',
);

#
# EOF
