#!/usr/bin/env perl
use strict;
use Test::More qw(no_plan);
use Test::Deep;

use KiokuX::Layer8::Storage;
use KiokuX::Layer8::User;

ok( my $store = KiokuX::Layer8::Storage->new( dsn => 'hash' ),
    'created a store' );
ok( my $user = KiokuX::Layer8::User->new( id => 'perigrin' ) );
ok( my $scope = $store->new_scope, 'new scope' );
ok( $store->add_user( $user ), 'add the user to the store' );
ok( my ($user2) = $store->find_user( $user->id )->all );
cmp_deeply( $user, $user2 );
