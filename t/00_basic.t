#!/usr/bin/env perl
use strict;

use Test::More qw(no_plan);

use KiokuX::Layer8::Storage;

ok(my $store = KiokuX::Layer8::Storage->new( dsn => 'hash'), 'created a store');
$store->add_user()
