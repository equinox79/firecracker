package FireCracker::Handler::ChatRoomHandler;
use strict;
use warnings;
use Tatsumaki;
use Tatsumaki::Error;
use Tatsumaki::Application;
use Time::HiRes;

use base qw(Tatsumaki::Handler);

sub get {
    my($self, $channel) = @_;
    $self->render('chat.html');
}

1;
