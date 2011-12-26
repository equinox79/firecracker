package FireCracker::Container;
use Mouse;
use Mouse::Util;
use MouseX::Foreign qw( Object::Container );
use File::Spec;

sub bootstrap {
    my ( $class, $container_file ) = @_;
    $container_file ||= File::Spec->catfile( 'etc', 'container.pl' );
    my $container = $class->new;
    my $builders = require( $container_file ) || [];
    for my $builder ( @$builders ) {
        my ( $key, $initializer, @options ) = @$builder;
        my $klass ||= $key =~ /^API::/ ? "FireCracker::$key" : $key;
        unless ( Mouse::Util::is_class_loaded( $klass ) ) {
            Mouse::Util::load_class( $klass );
        }
        $initializer ||= sub { $klass->new };
        $container->register( $key => $initializer, @options );
    }
    return $container;
}

no Mouse;
1;

