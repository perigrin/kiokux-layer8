package KiokuX::Layer8::Model;
use Moose::Role;
use namespace::autoclean;

requires qw(insert);

has user_class => (
    isa     => 'Str',
    is      => 'ro',
    default => 'KiokuX::Layer8::User',
);

sub add_user {
    my $self = shift;
    my ($user) = validated_list(
        \@_,
        user => {
            isa    => 'KiokuX::Layer8::User',
            coerce => 1,
        },
    );

    $self->txn_do( sub { $self->insert($user) } );
    return $user;
}

1;
__END__
