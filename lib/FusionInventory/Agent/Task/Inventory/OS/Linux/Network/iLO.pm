package FusionInventory::Agent::Task::Inventory::OS::Linux::Network::iLO;

use strict;
use warnings;

use FusionInventory::Agent::Tools;

sub isInventoryEnabled {
    return can_run('hponcfg');
}

sub doInventory {
    my (%params) = @_;

    my $inventory = $params{inventory};
    my $logger    = $params{logger};

    my $name;
    my $ipmask;
    my $ipgateway;
    my $speed;
    my $ipsubnet;
    my $ipaddress;
    my $status;
#  my $macaddr;

    foreach (`hponcfg -aw -`) {
        if ( /<IP_ADDRESS VALUE="([0-9.]+)"\/>/ ) {
            $ipaddress = $1;
        } elsif ( /<SUBNET_MASK VALUE="([0-9.]+)"\/>/ ) {
            $ipmask = $1;
        } elsif ( /<GATEWAY_IP_ADDRESS VALUE="([0-9.]+)"\/>/ ) {
            $ipgateway = $1;
        } elsif ( /<NIC_SPEED VALUE="([0-9]+)"\/>/ ) {
            $speed = $1;
        } elsif ( /<DNS_NAME VALUE="([^"]+)"\/>/ ) {
            $name = $1;
        } elsif ( /<ENABLE_NIC VALUE="(.)"\/>/ ) {
            $status = 'Up' if $1 =~ /Y/i;
        }
    }
    $ipsubnet = getSubnetAddress($ipaddress, $ipmask);

    #Some cleanups
    if ( $ipaddress eq '0.0.0.0' ) { $ipaddress = "" }
    if ( not $ipaddress and not $ipmask and $ipsubnet eq '0.0.0.0' ) { $ipsubnet = "" }
    if ( not $status ) { $status = 'Down' }

    $inventory->addNetwork({
        DESCRIPTION => 'Management Interface - HP iLO',
        IPADDRESS => $ipaddress,
        IPMASK => $ipmask,
        IPSUBNET => $ipsubnet,
        STATUS => $status,
        TYPE => 'Ethernet',
        SPEED => $speed,
        IPGATEWAY => $ipgateway,
        MANAGEMENT => 'iLO',
#        MACADDR => $macaddr,
#        PCISLOT => $pcislot,
#        DRIVER => $driver,
#        VIRTUALDEV => $virtualdev,
    });
}

1;
