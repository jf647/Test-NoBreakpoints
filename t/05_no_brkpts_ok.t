#
# $Id$
#

BEGIN {
    use Test::Tester 0.09;
    use Test::More tests => 46;
    chdir 't' if -d 't';
    use lib '../lib', '../blib/lib';
}

use Test::NoBreakpoints;

# test the tester for success
check_test(
    sub { no_brkpts_ok('foo') },
    {
        ok   => 1,
        name => 'no breakpoint test of foo',
    },
    'no_brkpts_ok works with implicit name',
);
check_test(
    sub { no_brkpts_ok('foo', 'yes, we have no breakpoints!') },
    {
        ok   => 1,
        name => 'yes, we have no breakpoints!',
    },
    'no_brkpts_ok works with explicit name',
);

# test the tester for failure
my @expected = (
    '$DB::signal =1',
    q{$DB'single=4},
    '$DB::signal= 1',
    '$DB::single = 3',
    '$DB::single = 1',
    q|$DB::single
=
1|,
);
for my $file( qw|bar1 bar2 bar3 bar4 bar5 bar6| ) {
    check_test(
        sub { no_brkpts_ok($file) },
        {
            ok   => 0,
            name => "no breakpoint test of $file",
            diag => "breakpoint found in $file: " . shift(@expected) . "\n",
        },
        'no_brkpts_ok finds simple breakpoint',
    );
}

#
# EOF

