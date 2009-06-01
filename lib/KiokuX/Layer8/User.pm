package KiokuX::Layer8::User;
use Moose;
use namespace::autoclean;

with qw(KiokuX::User::ID);

has identities => (
    isa => 'KiokuDB::Set',
    is  => 'ro',
);

1;
__END__
