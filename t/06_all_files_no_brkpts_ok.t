#
# $Id$
#

BEGIN {
    use Test::More tests => 1;
    chdir 't' if -d 't';
    use lib '../lib', '../blib/lib';
}

use Test::NoBreakpoints ':all';
use Test::Exception;
use Test::Builder::Tester;

# test the tester for failure
test_out('ok 1 - no breakpoint test of ./01_use.t');
test_out('ok 2 - no breakpoint test of ./02_pod.t');
test_out('ok 3 - no breakpoint test of ./04_all_perl_files.t');
test_out('not ok 4 - no breakpoint test of ./05_no_brkpts_ok.t');
test_out('not ok 5 - no breakpoint test of ./06_all_files_no_brkpts_ok.t');
test_out('not ok 6 - no breakpoint test of ./baz/foo.t');
test_out('not ok 7 - no breakpoint test of ./baz/gzonk/foo.pl');
test_out('ok 8 - no breakpoint test of ./baz/quux/Foo.pm');

test_err('#     Failed test (../lib/Test/NoBreakpoints.pm at line 141)');
test_err('# breakpoint found in ./05_no_brkpts_ok.t: $DB::signal =1');
test_err('#     Failed test (../lib/Test/NoBreakpoints.pm at line 141)');
test_err('# breakpoint found in ./06_all_files_no_brkpts_ok.t: $DB::signal =1');
test_err('#     Failed test (../lib/Test/NoBreakpoints.pm at line 141)');
test_err('# breakpoint found in ./baz/foo.t: $DB::signal = 1');
test_err('#     Failed test (../lib/Test/NoBreakpoints.pm at line 141)');
test_err('# breakpoint found in ./baz/gzonk/foo.pl: $DB::single = 2');

all_files_no_brkpts_ok( sort(all_perl_files('.')) );
test_test('all_files_no_brkpts_ok finds correct breakpoints');

#
# EOF
