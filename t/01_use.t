#
# $Id: 01_use.t,v 1.1 2004/01/28 20:11:24 james Exp $
#

use strict;
use warnings;

use Test::More tests => 2;

use_ok('Test::NoBreakpoints');
is($Test::NoBreakpoints::VERSION, '0.10', 'check module version');

#
# EOF
