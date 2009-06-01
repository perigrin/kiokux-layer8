package KiokuX::Layer8::Identity::Username;
use Moose;
use namespace::autoclean;

with qw(
  KiokuX::Layer8::Identity
  KiokuX::User::Password
);

1;
__END__
