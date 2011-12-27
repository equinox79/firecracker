package FireCracker::Handler::Root;
use strict;
use warnings;

use base qw(Tatsumaki::Handler);

sub get {
    my($self, $channel) = @_;
    $self->render('index.html');
}

1;
