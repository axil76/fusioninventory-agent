#!/usr/bin/perl

use strict;
use warnings;

use Test::More;

use FusionInventory::Agent::Task::Inventory::Input::Generic::Dmidecode::Battery;

my %tests = (
    'freebsd-6.2' => undef,
    'freebsd-8.1' => {
        NAME         => 'EV06047',
        SERIAL       => undef,
        MANUFACTURER => 'LGC-LGC',
        CHEMISTRY    => 'Lithium Ion'
    },
    'linux-2.6' => {
        NAME         => 'DELL C129563',
        MANUFACTURER => 'Samsung SDI',
        SERIAL       => undef,
        CHEMISTRY    => undef
    },
    'openbsd-3.7' => undef,
    'openbsd-3.8' => undef,
    'rhel-2.1' => undef,
    'rhel-3.4' => undef,
    'rhel-4.3' => undef,
    'rhel-4.6' => undef,
    'windows' => {
        NAME         => 'L9088A',
        SERIAL       => '2000417915',
        DATE         => '09/19/2002',
        MANUFACTURER => 'TOSHIBA',
        CHEMISTRY    => 'Lithium Ion'
    },
    'windows-hyperV' => undef
);

plan tests => scalar keys %tests;

foreach my $test (keys %tests) {
    my $file = "resources/generic/dmidecode/$test";
    my $battery = FusionInventory::Agent::Task::Inventory::Input::Generic::Dmidecode::Battery::_getBattery(file => $file);
    is_deeply($battery, $tests{$test}, $test);
}
