#
# $Id$
#

use strict;
use warnings;

use Test::More tests => 2;

use_ok('Test::NoBreakpoints');
is($Test::NoBreakpoints::VERSION, '0.10', 'check module version');

#
# EOF
