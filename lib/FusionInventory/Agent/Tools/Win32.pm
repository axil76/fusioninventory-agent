package FusionInventory::Agent::Tools::Win32;

use strict;
use warnings;
use base 'Exporter';

use Encode;
use English qw(-no_match_vars);

our @EXPORT = qw(
    getWmiProperties
    encodeFromWmi
    encodeFromRegistry
);

# We don't need to encode to UTF-8 on Win7
sub encodeFromWmi {
    my ($string) = @_;

#  return (Win32::GetOSName() ne 'Win7')?encode("UTF-8", $string):$string; 
    encode("UTF-8", $string); 

}

sub encodeFromRegistry {
    my ($string) = @_;

    encode("UTF-8", $string); 
}

sub getWmiProperties {
    my $wmiClass = shift;
    my @keys = @_;

    eval {
        require Win32::OLE;
        require Win32::OLE::Const;

        Win32::OLE->import(qw(in CP_UTF8));
        Win32::OLE->Option(CP => 'CP_UTF8');

        require Encode;
        Encode->import('encode');
    };
    if ($EVAL_ERROR) {
        print "STDERR, Failed to load Win32::OLE: $EVAL_ERROR\n";
        return;
    }

    my $WMIServices = Win32::OLE->GetObject(
            "winmgmts:{impersonationLevel=impersonate,(security)}!//./" );


    if (!$WMIServices) {
        print STDERR Win32::OLE->LastError();
    }


    my @properties;
    foreach my $properties ( Win32::OLE::in( $WMIServices->InstancesOf(
                    $wmiClass ) ) )
    {
        my $tmp;
        foreach (@keys) {
            my $val = $properties->{$_};
            $tmp->{$_} = encodeFromWmi($val);
        }
        push @properties, $tmp;
    }

    return @properties;
}

1;
