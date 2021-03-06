#!/usr/bin/perl

use strict;
use warnings;

use Test::More;

use FusionInventory::Agent::Task::Inventory::Input::AIX::Storages;

my %lsdev_tests = (
    'aix-4.3.1-disk-scsi' => [
        {
            NAME        => 'hdisk0',
            DESCRIPTION => '16 Bit SCSI Disk Drive',
        },
        {
            NAME        => 'hdisk1',
            DESCRIPTION => '16 Bit SCSI Disk Drive',
        },
        {
            NAME        => 'hdisk2',
            DESCRIPTION => '16 Bit SCSI Disk Drive',
        },
        {
            NAME        => 'hdisk3',
            DESCRIPTION => '16 Bit SCSI Disk Drive',
        },
        {
            NAME        => 'hdisk4',
            DESCRIPTION => 'Other SCSI Disk Drive',
        },
        {
            NAME        => 'hdisk5',
            DESCRIPTION => 'Other SCSI Disk Drive',
        }
    ],
    'aix-4.3.2-disk-scsi' => [
        {
            NAME        => 'hdisk0',
            DESCRIPTION => '16 Bit SCSI Disk Drive',
        },
        {
            NAME        => 'hdisk1',
            DESCRIPTION => '16 Bit SCSI Disk Drive',
        },
        {
            NAME        => 'hdisk2',
            DESCRIPTION => '16 Bit SCSI Disk Drive',
        },
        {
            NAME        => 'hdisk3',
            DESCRIPTION => '16 Bit SCSI Disk Drive',
        },
        {
            NAME        => 'hdisk4',
            DESCRIPTION => 'Other SCSI Disk Drive',
        },
        {
            NAME        => 'hdisk5',
            DESCRIPTION => 'Other SCSI Disk Drive',
        }
    ],
    'aix-5.3a-disk-scsi' => [
        {
            NAME        => 'hdisk0',
            DESCRIPTION => '16 Bit LVD SCSI Disk Drive',
        },
        {
            NAME        => 'hdisk1',
            DESCRIPTION => '16 Bit LVD SCSI Disk Drive',
        }
    ],
    'aix-5.3b-disk-scsi' => [
        {
            NAME        => 'hdisk0',
            DESCRIPTION => 'SCSI Disk Drive',
        },
        {
            NAME        => 'hdisk1',
            DESCRIPTION => 'SCSI Disk Drive',
        }
    ],
    'aix-5.3c-disk-vscsi' => [
        {
            NAME        => 'hdisk0',
            DESCRIPTION => 'Virtual SCSI Disk Drive',
        },
        {
            NAME        => 'hdisk1',
            DESCRIPTION => 'Virtual SCSI Disk Drive',
        }
    ],
    'aix-6.1a-disk-fcp' => [
        {
            NAME        => 'hdisk2',
            DESCRIPTION => 'Other FC SCSI Disk Drive',
        },
        {
            NAME        => 'hdisk3',
            DESCRIPTION => 'Other FC SCSI Disk Drive',
        },
        {
            NAME        => 'hdisk4',
            DESCRIPTION => 'Other FC SCSI Disk Drive',
        },
        {
            NAME        => 'hdisk5',
            DESCRIPTION => 'Other FC SCSI Disk Drive',
        },
        {
            NAME        => 'hdisk6',
            DESCRIPTION => 'Other FC SCSI Disk Drive',
        },
        {
            NAME        => 'hdisk7',
            DESCRIPTION => 'Other FC SCSI Disk Drive',
        },
        {
            NAME        => 'hdisk8',
            DESCRIPTION => 'Other FC SCSI Disk Drive',
        },
        {
            NAME        => 'hdisk9',
            DESCRIPTION => 'Other FC SCSI Disk Drive',
        },
        {
            NAME        => 'hdisk10',
            DESCRIPTION => 'Other FC SCSI Disk Drive',
        },
        {
            NAME        => 'hdisk11',
            DESCRIPTION => 'Other FC SCSI Disk Drive',
        },
        {
            NAME        => 'hdisk12',
            DESCRIPTION => 'Other FC SCSI Disk Drive',
        },
        {
            NAME        => 'hdisk13',
            DESCRIPTION => 'Other FC SCSI Disk Drive',
        },
        {
            NAME        => 'hdisk14',
            DESCRIPTION => 'Other FC SCSI Disk Drive',
        },
        {
            NAME        => 'hdisk15',
            DESCRIPTION => 'Other FC SCSI Disk Drive',
        },
        {
            NAME        => 'hdisk16',
            DESCRIPTION => 'Other FC SCSI Disk Drive',
        },
        {
            NAME        => 'hdisk17',
            DESCRIPTION => 'Other FC SCSI Disk Drive',
        }
    ],
    'aix-6.1a-disk-vscsi' => [
        {
            NAME        => 'hdisk0',
            DESCRIPTION => 'Virtual SCSI Disk Drive',
        },
        {
            NAME        => 'hdisk1',
            DESCRIPTION => 'Virtual SCSI Disk Drive',
        }
    ],
    'aix-6.1b-disk-sas' => [
        {
            NAME        => 'hdisk0',
            DESCRIPTION => 'SAS RAID 10 Disk Array',
        },
        {
            NAME        => 'hdisk1',
            DESCRIPTION => 'MPIO DS3200 SAS Disk',
        },
        {
            NAME        => 'hdisk2',
            DESCRIPTION => 'MPIO DS3200 SAS Disk',
        },
        {
            NAME        => 'hdisk4',
            DESCRIPTION => 'MPIO DS3200 SAS Disk',
        },
        {
            NAME        => 'hdisk5',
            DESCRIPTION => 'MPIO DS3200 SAS Disk',
        },
        {
            NAME        => 'hdisk6',
            DESCRIPTION => 'MPIO DS3200 SAS Disk',
        },
        {
            NAME        => 'hdisk7',
            DESCRIPTION => 'MPIO DS3200 SAS Disk',
        }
    ],
);

my %disk_tests = (
    'aix-6.1a' => {
        type  => 'fcp',
        disks => [
            {
                NAME        => 'hdisk2',
                DESCRIPTION => 'Other FC SCSI Disk Drive',
                TYPE        => 'disk',
            },
            {
                NAME         => 'hdisk3',
                DESCRIPTION  => 'Other FC SCSI Disk Drive',
                TYPE         => 'disk',
                MODEL        => 'DF600F',
                MANUFACTURER => 'HITACHI',
            },
            {
                NAME         => 'hdisk4',
                DESCRIPTION  => 'Other FC SCSI Disk Drive',
                TYPE         => 'disk',
                MODEL        => 'DF600F',
                MANUFACTURER => 'HITACHI',
            },
            {
                NAME         => 'hdisk5',
                DESCRIPTION  => 'Other FC SCSI Disk Drive',
                TYPE         => 'disk',
                MODEL        => 'DF600F',
                MANUFACTURER => 'HITACHI',
            },
            {
                NAME         => 'hdisk6',
                DESCRIPTION  => 'Other FC SCSI Disk Drive',
                TYPE         => 'disk',
                MODEL        => 'DF600F',
                MANUFACTURER => 'HITACHI',
            },
            {
                NAME         => 'hdisk7',
                DESCRIPTION  => 'Other FC SCSI Disk Drive',
                TYPE         => 'disk',
                MODEL        => 'DF600F',
                MANUFACTURER => 'HITACHI',
            },
            {
                NAME         => 'hdisk8',
                DESCRIPTION  => 'Other FC SCSI Disk Drive',
                TYPE         => 'disk',
                MODEL        => 'DF600F',
                MANUFACTURER => 'HITACHI',
            },
            {
                NAME         => 'hdisk9',
                DESCRIPTION  => 'Other FC SCSI Disk Drive',
                TYPE         => 'disk',
                MODEL        => 'DF600F',
                MANUFACTURER => 'HITACHI',
            },
            {
                NAME         => 'hdisk10',
                DESCRIPTION  => 'Other FC SCSI Disk Drive',
                TYPE         => 'disk',
                MODEL        => 'DF600F',
                MANUFACTURER => 'HITACHI',
            },
            {
                NAME         => 'hdisk11',
                DESCRIPTION  => 'Other FC SCSI Disk Drive',
                TYPE         => 'disk',
                MODEL        => 'DF600F',
                MANUFACTURER => 'HITACHI',
            },
            {
                NAME         => 'hdisk12',
                DESCRIPTION  => 'Other FC SCSI Disk Drive',
                TYPE         => 'disk',
                MODEL        => 'DF600F',
                MANUFACTURER => 'HITACHI',
            },
            {
                NAME         => 'hdisk13',
                DESCRIPTION  => 'Other FC SCSI Disk Drive',
                TYPE         => 'disk',
                MODEL        => 'DF600F',
                MANUFACTURER => 'HITACHI',
            },
            {
                NAME         => 'hdisk14',
                DESCRIPTION  => 'Other FC SCSI Disk Drive',
                TYPE         => 'disk',
                MODEL        => 'DF600F',
                MANUFACTURER => 'HITACHI',
            },
            {
                NAME         => 'hdisk15',
                DESCRIPTION  => 'Other FC SCSI Disk Drive',
                TYPE         => 'disk',
                MODEL        => 'DF600F',
                MANUFACTURER => 'HITACHI',
            },
            {
                NAME         => 'hdisk16',
                DESCRIPTION  => 'Other FC SCSI Disk Drive',
                TYPE         => 'disk',
                MODEL        => 'DF600F',
                MANUFACTURER => 'HITACHI',
            },
            {
                NAME         => 'hdisk17',
                DESCRIPTION  => 'Other FC SCSI Disk Drive',
                TYPE         => 'disk',
                MODEL        => 'DF600F',
                MANUFACTURER => 'HITACHI',
            }
        ]
    },
    'aix-6.1b' => {
        type  => 'sas',
        disks => [
            {
                NAME         => 'hdisk0',
                DESCRIPTION  => 'SAS RAID 10 Disk Array',
                TYPE         => 'disk'
            },
            {
                NAME         => 'hdisk1',
                DESCRIPTION  => 'MPIO DS3200 SAS Disk',
                TYPE         => 'disk',
                MODEL        => '1726-2xx  FAStT',
                MANUFACTURER => 'IBM',
            },
            {
                NAME         => 'hdisk2',
                DESCRIPTION  => 'MPIO DS3200 SAS Disk',
                TYPE         => 'disk',
                MODEL        => '1726-2xx  FAStT',
                MANUFACTURER => 'IBM',
            },
            {
                NAME         => 'hdisk4',
                DESCRIPTION  => 'MPIO DS3200 SAS Disk',
                TYPE         => 'disk',
                MODEL        => '1726-2xx  FAStT',
                MANUFACTURER => 'IBM',
            },
            {
                NAME         => 'hdisk5',
                DESCRIPTION  => 'MPIO DS3200 SAS Disk',
                TYPE         => 'disk',
                MODEL        => '1726-2xx  FAStT',
                MANUFACTURER => 'IBM',
            },
            {
                NAME         => 'hdisk6',
                DESCRIPTION  => 'MPIO DS3200 SAS Disk',
                TYPE         => 'disk',
                MODEL        => '1726-2xx  FAStT',
                MANUFACTURER => 'IBM',
            },
            {
                NAME         => 'hdisk7',
                DESCRIPTION  => 'MPIO DS3200 SAS Disk',
                TYPE         => 'disk',
                MODEL        => '1726-2xx  FAStT',
                MANUFACTURER => 'IBM',
            }
        ],
    }
);

plan tests =>
    (scalar keys %lsdev_tests) +
    (scalar keys %disk_tests);

foreach my $test (keys %lsdev_tests) {
    my $file = "resources/aix/lsdev/$test";
    my @devices = FusionInventory::Agent::Task::Inventory::Input::AIX::Storages::_parseLsdev(file => $file, pattern => qr/^(.+):(.+)/);
    is_deeply(\@devices, $lsdev_tests{$test}, "lsdev parsing: $test");
}

foreach my $test (keys %disk_tests) {
    my $lsvpd_file = "resources/aix/lsvpd/$test";
    my $lsdev_file = "resources/aix/lsdev/$test-disk-$disk_tests{$test}->{type}";
    my $infos = FusionInventory::Agent::Task::Inventory::Input::AIX::Storages::_getIndexedLsvpdInfos(file => $lsvpd_file);
    my @disks = FusionInventory::Agent::Task::Inventory::Input::AIX::Storages::_getDisks(file => $lsdev_file, infos => $infos);
    is_deeply(\@disks, $disk_tests{$test}->{disks}, "disk extraction: $test");
}
