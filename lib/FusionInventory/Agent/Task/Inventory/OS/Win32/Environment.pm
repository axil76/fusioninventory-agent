package FusionInventory::Agent::Task::Inventory::OS::Win32::Environment;

use strict;
use warnings;

use FusionInventory::Agent::Tools::Win32;

sub isInventoryEnabled {
    return 1;
}

sub doInventory {
    my ($params) = @_;

    my $inventory = $params->{inventory};

    foreach my $Properties (getWmiProperties('Win32_Environment', qw/
        SystemVariable Name VariableValue    
    /)) {

        next unless $Properties->{SystemVariable};

        $inventory->addEnv({
            KEY => $Properties->{Name},
            VAL => $Properties->{VariableValue}
        });
    }
}

1;