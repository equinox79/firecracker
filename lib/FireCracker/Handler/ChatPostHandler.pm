package FireCracker::Handler::ChatPostHandler;
use strict;
use warnings;
use Tatsumaki;
use Tatsumaki::Error;
use Tatsumaki::Application;
use Time::HiRes;

use base qw(Tatsumaki::Handler);
use HTML::Entities;
use Encode;

sub post {
    my($self, $channel) = @_;

    my $v = $self->request->parameters;
    my $html = $self->format_message($v->{text});
    my $mq = Tatsumaki::MessageQueue->instance($channel);
    $mq->publish({
        type => "message", html => $html, ident => $v->{ident},
        avatar => $v->{avatar}, name => $v->{name},
        address => $self->request->address,
        time => scalar Time::HiRes::gettimeofday,
    });
    $self->write({ success => 1 });
}

sub format_message {
    my($self, $text) = @_;
    $text =~ s{ (https?://\S+) | ([&<>"']+) }
              { $1 ? do { my $url = HTML::Entities::encode($1); qq(<a target="_blank" href="$url">$url</a>) } :
                $2 ? HTML::Entities::encode($2) : '' }egx;
    $text = Encode::decode_utf8( $text );
    $text;
}

1;
