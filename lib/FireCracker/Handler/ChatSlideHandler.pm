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
    my $html = $self->build_html( $v );
    my $mq = Tatsumaki::MessageQueue->instance($channel);
    $mq->publish({
        type => "message", 
        html => $html, 
        address => $self->request->address,
        time => scalar Time::HiRes::gettimeofday,
    });
    $self->write({ success => 1 });
}

sub build_html {
    my ( $self, $param ) = @_;
    my $url = $param->get('url');
    my $agent = $self->application->get( 'Furl' );
    my $res = $agent->get( $url );
    die "$url replies $res->code" unless $res->is_success;
    my $scraper = $self->application->get( 'API::SlideScrape' );
    my $doc = $scraper->( $res->content );
    return "slide=$doc";
}

1;
