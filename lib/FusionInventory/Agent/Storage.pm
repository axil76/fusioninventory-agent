package FusionInventory::Agent::Storage;
        
use strict;
use warnings;

use Config;
use English qw(-no_match_vars);
use File::Glob qw(:glob);
use File::Path qw(mkpath);
use Storable;

use FusionInventory::Agent::Logger;

sub new {
    my ($class, %params) = @_;

    die "no directory parameter" unless $params{directory};

    if (!-d $params{directory}) {
        mkpath($params{directory}, {error => \my $err});
        if (@$err) {
            my (undef, $message) = %{$err->[0]};
            die "Can't create $params{directory}: $message";
        }
    }

    if (! -w $params{directory}) {
        die "Can't write in $params{directory}";
    }

    my $self = {
        logger    => $params{logger} ||
                     FusionInventory::Agent::Logger->new(),
        directory => $params{directory}
    };

    bless $self, $class;

    return $self;
}

sub getDirectory {
    my ($self) = @_;

    return $self->{directory};
}

sub _getFilePath {
    my ($self, %params) = @_;

    die "no name parameter given" unless $params{name};

    return $self->{directory} . '/' . $params{name} . '.dump';
}

sub has {
    my ($self, %params) = @_;

    my $file = $self->_getFilePath(%params);

    return -f $file;
}

sub save {
    my ($self, %params) = @_;

    my $file = $self->_getFilePath(%params);

    store($params{data}, $file) or warn;
}

sub restore {
    my ($self, %params) = @_;

    my $file = $self->_getFilePath(%params);

    return unless -f $file;
    return retrieve($file);
}

sub remove {
    my ($self, %params) = @_;

    my $file = $self->_getFilePath(%params);

    unlink $file or $self->{logger}->error("can't unlink $file");
}

1;
__END__

=head1 NAME

FusionInventory::Agent::Storage - A data serializer/deserializer

=head1 SYNOPSIS

  my $storage = FusionInventory::Agent::Storage->new(
      directory => '/tmp'
  );
  my $data = $storage->restore(
      module => "FusionInventory::Agent"
  );

  $data->{foo} = 'bar';

  $storage->save(data => $data);

=head1 DESCRIPTION

This is the object used by the agent to ensure data persistancy between
invocations.

Each data structure is saved in a file, whose name is automatically determined
according to object class name. An optional index number can be used to
differentiate between consecutives usages.

=head1 METHODS

=head2 new(%params)

The constructor. The following parameters are allowed, as keys of the %params
hash:

=over

=item I<logger>

the logger object to use

=item I<directory>

the directory to use for storing data (mandatory)

=back

=head2 getDirectory

Returns the underlying directory for this storage.

=head2 has(%params)

Returns true if a saved data structure exists. The following arguments are
allowed:

=over

=item I<name>

The file name to use for saving the data structure (mandatory).

=back

=head2 save(%params)

Save given data structure. The following parameters are allowed, as keys of the
%params hash:

=over

=item I<name>

The file name to use for saving the data structure (mandatory).

=back

=head2 restore(%params)

Restore a saved data structure. The following parameters are allowed, as keys
of the %params hash:

=over

=item I<name>

The file name to use for saving the data structure (mandatory).

=back

=head2 remove(%params)

Delete the file containing a seralized data structure for a given module. The
following parameters are allowed, as keys of the %params hash:

=over

=item I<name>

The file name to use for saving the data structure (mandatory).

=back
