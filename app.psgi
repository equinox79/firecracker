use strict;
use warnings;

use FireCracker::Application;
use FireCracker::Container;
use File::Basename;

my $container = FireCracker::Container->bootstrap;

my $chat_re = '[\w\.\-]+';
my $app = FireCracker::Application->new([
    "/chat/($chat_re)/poll" => 'FireCracker::Handler::ChatPollHandler',
    "/chat/($chat_re)/mxhrpoll" => 'FireCracker::Handler::ChatMultipartPollHandler',
    "/chat/($chat_re)/post" => 'FireCracker::Handler::ChatPostHandler',
    "/chat/($chat_re)" => 'FireCracker::Handler::ChatRoomHandler',
]);

$app->template_path(dirname(__FILE__) . "/templates");
$app->static_path(dirname(__FILE__) . "/static");
$app->container( $container );

return $app->psgi_app;
