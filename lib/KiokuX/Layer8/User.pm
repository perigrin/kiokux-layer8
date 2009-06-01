package KiokuX::Layer8::User;
use Moose;

has identities => (
    isa => 'KiokuDB::Set',
    is  => 'ro',
);
