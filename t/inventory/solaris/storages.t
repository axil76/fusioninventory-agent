#!/usr/bin/perl

use strict;
use warnings;

use Test::More;

use FusionInventory::Agent::Task::Inventory::Input::Solaris::Storages;

my %tests = (
    'sample1' => [
        {
            NAME         => 'c8t60060E80141A420000011A420000300Bd0',
            DISKSIZE     => 64424,
            FIRMWARE     => '5009',
            DESCRIPTION  => 'FW:5009',
            MANUFACTURER => 'HITACHI',
            MODEL        => 'OPEN-V      -SUN'
        },
    ],
    'sample2' => [
       {
            NAME         => 'sd0',
            DISKSIZE     => 73400,
            FIRMWARE     => 'PQ08',
            DESCRIPTION  => 'S/N:43W14Z080040A34E FW:PQ08',
            MANUFACTURER => 'HITACHI',
            SERIALNUMBER => '43W14Z080040A34E',
            MODEL        => 'DK32EJ72NSUN72G'
        }
    ],
    'sample3-wrong-vendor-product' => [
       {
            NAME         => 'c0t0d0',
            DISKSIZE     => 0,
            FIRMWARE     => 'RX02',
            DESCRIPTION  => 'FW:RX02',
            MANUFACTURER => 'Optiarc',
            MODEL        => 'DVD-ROM DDU810A'
        },
        {
            NAME         => 'c3t0d0',
            DISKSIZE     => 145999,
            FIRMWARE     => '1.11',
            DESCRIPTION  => 'FW:1.11',
            MANUFACTURER => 'INTEL',
            MODEL        => 'SROMBSASFC'
        },
        {
            NAME         => 'c3t1d0',
            DISKSIZE     => 145999,
            FIRMWARE     => '1.11',
            DESCRIPTION  => 'FW:1.11',
            MANUFACTURER => 'INTEL',
            MODEL        => 'SROMBSASFC'
        },
        {
            NAME         => 'c1t13d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t14d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t13d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t14d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t15d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t16d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t17d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t18d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t19d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t20d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t21d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t22d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t23d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t24d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t25d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t26d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t27d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t28d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t29d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t30d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t31d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t32d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t33d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t34d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t35d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t36d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t37d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t38d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t39d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t40d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t41d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t42d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t43d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t44d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t45d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t46d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t47d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t48d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t49d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t50d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t51d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t52d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t53d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t54d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t55d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t56d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t57d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t58d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t59d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t60d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t61d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t62d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t63d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t64d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t65d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t66d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t67d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t68d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t69d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t70d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t71d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c2t72d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c6t8d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c6t9d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c6t10d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c6t11d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c6t12d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c6t13d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c11t8d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c6t15d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c6t16d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c6t17d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c6t18d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c6t19d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c6t20d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c6t21d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c6t22d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c6t23d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c6t24d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c6t25d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c6t26d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c11t9d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c6t28d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c6t29d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c6t30d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c6t31d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c6t32d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c6t33d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c6t34d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c6t35d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c6t36d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c6t37d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c6t38d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c6t39d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c11t10d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c6t41d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR38',
            DESCRIPTION  => 'FW:XR38',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c6t42d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR38',
            DESCRIPTION  => 'FW:XR38',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c6t43d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c6t44d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c6t45d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c6t46d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c11t11d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c11t12d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c11t13d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c11t15d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c11t16d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c11t17d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c11t18d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c11t19d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c11t20d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR38',
            DESCRIPTION  => 'FW:XR38',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c11t21d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c11t22d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c11t23d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c11t24d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c11t25d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c11t26d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c11t28d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR38',
            DESCRIPTION  => 'FW:XR38',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c11t29d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c11t30d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c11t31d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c11t32d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c1t15d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t16d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t17d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t18d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t19d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t20d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t21d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t22d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t23d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t24d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t25d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t26d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t27d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t28d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t29d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t30d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t31d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t32d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t33d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t34d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t35d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t36d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t37d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t38d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t39d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t40d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t71d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t41d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t42d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t43d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t44d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t45d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t46d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t47d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t48d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t49d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t50d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t51d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t52d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t53d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t54d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t55d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t56d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t57d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t58d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t59d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t60d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t61d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t62d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t63d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t64d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t65d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t66d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t67d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t68d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t69d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t70d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c1t72d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'A70M',
            DESCRIPTION  => 'FW:A70M',
            MANUFACTURER => 'Hitachi',
            MODEL        => 'HUA72101'
        },
        {
            NAME         => 'c11t33d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c11t34d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c11t35d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c11t36d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c11t37d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c11t38d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c11t39d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c11t41d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c11t42d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c11t43d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c11t44d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c11t45d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c11t46d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c11t47d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c11t48d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c11t49d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XQ32',
            DESCRIPTION  => 'FW:XQ32',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310005'
        },
        {
            NAME         => 'c11t50d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c11t51d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c11t52d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c11t54d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c11t55d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c11t56d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c11t57d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c11t58d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c11t59d0',
            DISKSIZE     => 1000204,
            FIRMWARE     => 'XR3A',
            DESCRIPTION  => 'FW:XR3A',
            MANUFACTURER => 'SEAGATE',
            MODEL        => 'ST310003'
        },
        {
            NAME         => 'c7t0d0',
            DISKSIZE     => 0,
            FIRMWARE     => '0.01',
            DESCRIPTION  => 'FW:0.01',
            MANUFACTURER => 'Intel',
            MODEL        => 'RMM2 VDrive 1'
        },
        {
            NAME         => 'c8t0d0',
            DISKSIZE     => 0,
            FIRMWARE     => '0.01',
            DESCRIPTION  => 'FW:0.01',
            MANUFACTURER => 'Intel',
            MODEL        => 'RMM2 VDrive 2'
        },
        {
            NAME         => 'c10t0d0',
            DISKSIZE     => 0,
            FIRMWARE     => '0.01',
            DESCRIPTION  => 'FW:0.01',
            MANUFACTURER => 'Intel',
            MODEL        => 'RMM2 VDrive 4'
        },
        {
            NAME         => 'c9t0d0',
            DISKSIZE     => 0,
            FIRMWARE     => '0.01',
            DESCRIPTION  => 'FW:0.01',
            MANUFACTURER => 'Intel',
            MODEL        => 'RMM2 VDrive 3'
        }
    ]
);

plan tests => scalar keys %tests;

foreach my $test (keys %tests) {
    my $file = "resources/solaris/iostat/$test";
    my @storages = FusionInventory::Agent::Task::Inventory::Input::Solaris::Storages::_getStorages(file => $file);
    is_deeply(\@storages, $tests{$test}, $test);
}
