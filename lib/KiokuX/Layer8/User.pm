package KiokuX::Layer8::User;
use Moose;
use namespace::autoclean;

with qw(KiokuX::User::ID);

use Data::UUID;
has '+id' => ( default =>  sub { Data::UUID->new->create_str } );


has identities => (
    isa => 'KiokuDB::Set',
    is  => 'ro',
);

1;
__END__
