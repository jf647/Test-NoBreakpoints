#
# $Id$
#

BEGIN {
    use Test::More tests => 1;
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
   ./05_no_brkpts_ok.t
   ./06_all_files_no_brkpts_ok.t
   ./baz/foo.t
   ./baz/gzonk/foo.pl
   ./baz/quux/Foo.pm
|;
my @gotback = sort( all_perl_files('.') );

is_deeply(\@gotback, \@expected, 'all perl files found');

#
# EOF
