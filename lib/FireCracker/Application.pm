package FireCracker::Application;

use Mouse;
use Mouse::Util;
extends qw/ Tatsumaki::Application /;

around BUILDARGS => sub {
    my $next = shift; 
    my $class = shift;
    my ( $args ) = @_;
    if ( ref $args eq 'ARRAY' ) {
        my %path = @$args;
        for my $klass ( values %path ) {
            Mouse::Util::load_class( $klass );
        }
    }
    $class->$next( @_ );
};

no Mouse;

1;

