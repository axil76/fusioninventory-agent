package FusionInventory::Agent::Task::Inventory::OS::Generic::Dmidecode::Battery;
use strict;
use warnings;

use English qw(-no_match_vars);

use FusionInventory::Agent::Tools;

sub parseDate {
    my $string = shift;

    if ($string =~ /(\d{1,2})([\/-])(\d{1,2})([\/-])(\d{2})/) {
        my $d = $1;
        my $m = $3;
        my $y = ($5>90?"19":"20").$5;

        return "$1/$3/$y";
    } elsif ($string =~ /(\d{4})([\/-])(\d{1,2})([\/-])(\d{1,2})/) {
        my $y = ($5>90?"19":"20").$1;
        my $d = $3;
        my $m = $5;

        return "$d/$m/$y";
    }


}

sub doInventory {
    my $params = shift;
    my $inventory = $params->{inventory};

    my $battery = getBattery();

    $inventory->addBattery($battery);
}

sub getBattery {
    my ($file) = @_;

    my $infos = getInfoFromDmidecode($file);

    return unless $infos->{22};

    my $info    = $infos->{22}->[0];

    my $battery = {
        NAME         => $info->{'Name'},
        MANUFACTURER => $info->{'Manufacturer'},
        SERIAL       => $info->{'Serial Number'},
        CHEMISTRY    => $info->{'Chemistry'},
    };

    if ($info->{'Manufacture Date'}) {
        $battery->{DATE} = parseDate($info->{'Manufacture Date'});
    }

    if ($info->{Capacity} && $info->{Capacity} =~ /(\d+) \s m(W|A)h$/x) {
        $battery->{CAPACITY} = $1;
    }

    if ($info->{Voltage} && $info->{Voltage} =~ /(\d+) \s mV$/x) {
        $battery->{VOLTAGE} = $1;
    }

    foreach my $key (keys %$battery) {
       delete $battery->{$key} if !defined $battery->{$key};
    }

    return $battery;
}

1;
