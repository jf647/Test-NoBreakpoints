#
# $Id: 02_pod.t,v 1.1 2004/01/21 22:23:06 james Exp $
#

use Test::More;
eval "use Test::Pod 1.00";
plan skip_all => "Test::Pod 1.00 required for testing POD" if $@;
all_pod_files_ok();

#
# EOF

