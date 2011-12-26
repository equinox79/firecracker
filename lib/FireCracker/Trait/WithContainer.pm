package FireCracker::Trait::WithContainer;
use Mouse::Role;

has container => ( is => 'rw' );

sub get {
    my ( $self, $key ) = @_;
    return $self->container->get( $key );
};

no Mouse::Role;
1;
