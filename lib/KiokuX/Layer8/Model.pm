package KiokuX::Layer8::Model;
use Moose::Role;
use MooseX::Params::Validate;

use namespace::autoclean;

requires qw(insert search user_class);

sub add_user {
    my $self = shift;
    my ($user) =
      validated_list( \@_, user => { isa => 'KiokuX::Layer8::User', }, );

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
