#!/usr/bin/perl

use strict;
use warnings;
use Test::More;
use English qw(-no_match_vars);

if (!$ENV{TEST_AUTHOR}) {
    my $msg = 'Author test. Set $ENV{TEST_AUTHOR} to a true value to run.';
    plan(skip_all => $msg);
}

eval { require Test::Perl::Critic; };

if ($EVAL_ERROR) {
    my $msg = 'Test::Perl::Critic required to criticise code';
    plan(skip_all => $msg);
}

my $config = File::Spec->catfile('t', 'perlcriticrc');
Test::Perl::Critic->import(-profile => $config);
all_critic_ok();

