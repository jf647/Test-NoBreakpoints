#
# $Id$
#

BEGIN {
    use Test::More tests => 9;
    chdir 't' if -d 't';
    use lib '../lib', '../blib/lib';
}

use Test::NoBreakpoints;
use Test::Exception;
use Test::Builder::Tester;

# test that the file foo has no breakpoints in it
lives_and {
    no_brkpts_ok('foo');
} 'foo does not have breakpoints';

# test the tester for success
test_out("ok 1 - no breakpoint test of foo");
no_brkpts_ok('foo');
test_test("no_brkpts_ok works with default name");

test_out("ok 1 - yes, we have no breakpoints!");
no_brkpts_ok('foo', 'yes, we have no breakpoints!');
test_test("no_brkpts_ok works with explicit name");

# test the tester for failure
my @expected = (
    '$DB::signal =1',
    q{$DB'single=4},
    '$DB::signal= 1',
    '$DB::single = 3',
    '$DB::single = 1',
    q|$DB::single
# =
# 1|,
);
for my $file( qw|bar1 bar2 bar3 bar4 bar5 bar6| ) {
    test_out("not ok 1 - no breakpoint test of $file");
    test_fail(+2);
    test_diag("breakpoint found in $file: " . shift @expected);
    no_brkpts_ok($file);
    test_test("no_brkpts_ok finds simple breakpoint");
}

#
# EOF

