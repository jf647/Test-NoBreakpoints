#
# $Id$
#

use Module::Build;

my $build = Module::Build->new(
	module_name         => 'Test::NoBreakpoints',
    dist_version_from   => 'lib/Test/NoBreakpoints.pm',
	license             => 'perl',
    create_makefile_pl  => 'passthrough',
    create_readme       => 1,
    requires            => {
        Test::Builder         => 0,
        Test::Builder::Tester => 0,
    },
    build_requires      => {
        Test::More            => 0,
        Test::Exception       => 0,
    },
);

$build->create_build_script;

#
# EOF
