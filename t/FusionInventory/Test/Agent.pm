package FusionInventory::Test::Agent;

use strict;
use warnings;
use base qw(FusionInventory::Agent);

sub new {
    my ($class) = @_;

    my $self = {
        status => 'ok'
    };
    bless $self, $class;

    return $self;
}

1;
