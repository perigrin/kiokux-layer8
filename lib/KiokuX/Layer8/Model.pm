package KiokuX::Layer8::Model;
use Moose::Role;
use MooseX::Params::Validate;

use namespace::autoclean;

requires qw(insert search);

sub add_user {
    my $self = shift;
    my ($user) =
      pos_validated_list( \@_,
        { isa => 'KiokuX::Layer8::User', coerce => 1, } );

    $self->txn_do( sub { $self->insert($user) } );
    return $user;
}

sub find_user {
    my ( $self, $id ) = @_;
    my $value = $self->search( { id => $id } );
    return $value;
}

1;
__END__
