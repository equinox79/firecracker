package FireCracker::Handler::ChatSlideHandler;
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
    $self->publish( $channel, $self->build_msg( $v ) );
    $self->write({ success => 1 });
}

sub build_msg {
    my ( $self, $param ) = @_;
    my $url = $param->get('url');
    my $agent = $self->application->get( 'Furl' );
    my $res = $agent->get( $url );
    die "$url replies $res->code" unless $res->is_success;
    my $scraper = $self->application->get( 'API::SlideScrape' );
    my $data = $scraper->( $res->content );
    my @rtn;
    for my $key ( qw( doc title author description ) ) { 
        push @rtn, sprintf( "$key=%s", $data->{$key} );
    }
    return Encode::decode_utf8( join ",", @rtn );
}

sub publish {
    my ( $self, $channel, $str ) = @_;
    my $mq = Tatsumaki::MessageQueue->instance($channel);
    $mq->publish({
        type => "message", 
        html => $str, 
        ident => 'system',
        address => $self->request->address,
        time => scalar Time::HiRes::gettimeofday,
    });
}

1;
