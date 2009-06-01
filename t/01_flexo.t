#!/usr/bin/env perl
use strict;
use Test::More qw(no_plan);
use Test::Deep;
{

    package Flexo::Storage;
    use Moose;
    use namespace::autoclean;

    extends qw(KiokuX::Layer8::Storage);

    sub get_user_by_nick {
        my ( $self, $nick ) = @_;
        ( $self->search( { nickstr => $nick } )->next )[0];
    }
}
{

    package Flexo::Storage::User;
    use Moose;
    use namespace::autoclean;

    use KiokuDB::Util qw(set);

    extends qw(KiokuX::Layer8::User);

    has nickstr => (
        isa      => 'Str',
        is       => 'ro',
        required => 1,
    );

    for my $level (qw(channel_op channel_voice channel_halfop )) {
        has $level => (
            does    => "KiokuDB::Set",
            is      => 'ro',
            lazy    => 1,
            default => sub { set( [] ) },
            handles => {
                "has_${level}" => 'member',
                "add_${level}" => 'insert',
            }
        );
    }

}

ok(
    my $s = Flexo::Storage->new(
        dsn        => 'dbi:SQLite:dbname=test.db',
        extra_args => {
            create  => 1,
            columns => [
                nickstr => {
                    data_type   => "varchar",
                    is_nullable => 1,
                },
            ],
        }
    ),
    'new Flexo::Storage'
);

ok(
    my $u =
      Flexo::Storage::User->new( nickstr => 'perigrin!perigrin@127.0.0.1)' ),
    'new user'
);
ok( my $scope = $s->new_scope, 'new scope' );
ok( my $uuid  = $s->store($u), 'store the user' );

ok( my $u2 = $s->get_user_by_nick('perigrin!perigrin@127.0.0.1'),
    'get_user_by_nick' );
cmp_deeply( $u2, $u, 'they tieout' );

unlink('test.db');