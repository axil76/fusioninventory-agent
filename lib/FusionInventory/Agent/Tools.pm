package FusionInventory::Agent::Tools;

use strict;
use warnings;
use base 'Exporter';

our @EXPORT = qw(getManufacturer getIpDhcp);

sub getManufacturer {
    my ($model) = @_;

    if ($model =~ /(
        maxtor    |
        western   |
        sony      |
        compaq    |
        ibm       |
        seagate   |
        toshiba   |
        fujitsu   |
        lg        |
        samsung   |
        nec       |
        transcend |
        matshita  |
        pioneer
    )/xi) {
        $model = ucfirst(lc($1));
    } elsif ($model =~ /^(HP|hewlett packard)/) {
        $model = "Hewlett Packard";
    } elsif ($model =~ /^WDC/) {
        $model = "Western Digital";
    } elsif ($model =~ /^ST/) {
        $model = "Seagate";
    } elsif ($model =~ /^(HD|IC|HU)/) {
        $model = "Hitachi";
    }

    return $model;
}

sub getIpDhcp {
    my $if = shift;

    my $path;
    my $leasepath;

    foreach ( # XXX BSD paths
        "/var/db/dhclient.leases.%s",
        "/var/db/dhclient.leases",
        # Linux path for some kFreeBSD based GNU system
        "/var/lib/dhcp3/dhclient.%s.leases",
        "/var/lib/dhcp3/dhclient.%s.leases",
        "/var/lib/dhcp/dhclient.leases") {

        $leasepath = sprintf($_,$if);
        last if (-e $leasepath);
    }
    return unless -e $leasepath;

    my ($server_ip, $expiration_time);

    my $handle;
    if (!open $handle, '<', $leasepath) {
        warn "Can't open $leasepath\n";
        return;
    }

    my ($lease, $dhcp);

    # find the last lease for the interface with its expire date
    while(<$handle>){
        $lease = 1 if /lease\s*{/i;
        $lease = 0 if /^\s*}\s*$/;

        next unless $lease;

        # inside a lease section
        if (/interface\s+"(.+?)"\s*/){
            $dhcp = ($1 eq $if);
        }

        next unless $dhcp;

        if (/option\s+dhcp-server-identifier\s+(\d{1,3}(?:\.\d{1,3}){3})\s*;/) {
            # server IP
            $server_ip = $1;
        }
        if (/^\s*expire\s*\d\s*(\d*)\/(\d*)\/(\d*)\s*(\d*):(\d*):(\d*)/) {
            $expiration_time =
                sprintf "%04d%02d%02d%02d%02d%02d", $1, $2, $3, $4, $5, $6;
        }
    }
    close $handle;

    my $current_time = `date +"%Y%m%d%H%M%S"`;
    chomp $current_time;

    return $current_time <= $expiration_time ? $server_ip : undef;
}

1;
