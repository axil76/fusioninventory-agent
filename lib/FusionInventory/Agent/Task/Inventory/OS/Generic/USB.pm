package FusionInventory::Agent::Task::Inventory::OS::Generic::USB;
# tested with:
# lsusb (usbutils) 0.86

use strict;
use warnings;

use FusionInventory::Agent::Tools;

sub isInventoryEnabled {
    return can_run('lsusb');
}

sub doInventory {
    my (%params) = @_;

    my $inventory = $params{inventory};
    my $logger    = $params{logger};

    foreach my $device (_getDevices($logger)) {
        next unless $device->{PRODUCTID};
        next unless $device->{VENDORID};

        # ignore the USB Hub
        next if
            $device->{PRODUCTID} eq "0001" ||
            $device->{PRODUCTID} eq "0002" ;

        if (defined($device->{SERIAL}) && length($device->{SERIAL}) < 5) {
            $device->{SERIAL} = undef;
        }

        $inventory->addUSBDevice($device);
    }
}

sub _getDevices {
    my ($logger, $file) = @_;

    my $handle = getFileHandle(
        logger  => $logger,
        file    => $file,
        command => 'lsusb -v',
    );

    return unless $handle;

    my @devices;
    my $device;

    while (my $line = <$handle>) {
        if ($line =~ /^$/) {
            push @devices, $device if $device;
            undef $device;
        } elsif ($line =~ /^\s*idVendor\s*0x(\w+)/i) {
            $device->{VENDORID} = $1;
        } elsif ($line =~ /^\s*idProduct\s*0x(\w+)/i) {
            $device->{PRODUCTID} = $1;
        } elsif ($line =~ /^\s*iSerial\s*\d+\s(\w+)/i) {
            $device->{SERIAL} = $1;
        } elsif ($line =~ /^\s*bInterfaceClass\s*(\d+)/i) {
            $device->{CLASS} = $1;
        } elsif ($line =~ /^\s*bInterfaceSubClass\s*(\d+)/i) {
            $device->{SUBCLASS} = $1;
        }
    }
    close $handle;
    push @devices, $device if $device;

    return @devices;
}

1;
