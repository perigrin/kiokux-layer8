package KiokuX::Layer8::Identity;
use Moose::Role;
use namespace::autoclean;

has user => (
    isa      => 'KiokuX::Layer8::User',
    is       => 'ro',
    required => 1,
    handles  => qw(ID),
);

1;
__END__
