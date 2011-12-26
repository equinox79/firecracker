use strict;
use warnings;

use FireCracker::Application;
use FireCracker::Container;
use File::Basename;
use File::Spec;

my $container = FireCracker::Container->bootstrap;
my $router = File::Spec->catfile( 'etc', 'routes.pl' );

my $app = FireCracker::Application->new( require( $router ) );

$app->template_path(dirname(__FILE__) . "/templates");
$app->static_path(dirname(__FILE__) . "/static");
$app->container( $container );

return $app->psgi_app;
