#
# $Id$
#

BEGIN {
    use Test::More;
    our $tests = 1;
    eval "use Test::NoWarnings";
    $tests++ unless( $@ );
    plan tests => $tests;
    chdir 't' if -d 't';
    use lib '../lib', '../blib/lib';
}

use Test::NoBreakpoints 'all_perl_files';
use Test::Exception;

# test that all files in the test directory are found properly
my @expected = sort qw|
   ./01_use.t
   ./02_pod.t
   ./04_all_perl_files.t
   ./05_no_breakpoints_ok.t
   ./06_all_files_no_breakpoints_ok.t
   ./07_deprecated_warnings.t
   ./08_deprecated.t
   ./baz/foo.t
   ./baz/gzonk/foo.pl
   ./baz/quux/Foo.pm
|;
my @gotback = sort( all_perl_files('.') );

is_deeply(\@gotback, \@expected, 'all perl files found');

#
# EOF
