#
# $Id$
#

use Module::Build;

Module::Build->new(

	module_name         => 'Test::NoBreakpoints',

    dist_version_from   => 'lib/Test/NoBreakpoints.pm',

	license             => 'perl',

    create_makefile_pl  => 'traditional',

    create_readme       => 1,

    requires            => {
        Test::Builder         => 0,
    },

    build_requires      => {
        Test::More            => 0,
        Test::Exception       => 0,
        Test::Tester          => 0.09,
    },

    add_to_cleanup      => [ qw|
        Makefile
    | ],

)->create_build_script;

#
# EOF
