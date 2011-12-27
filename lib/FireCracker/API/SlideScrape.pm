package FireCracker::API::SlideScrape;
use strict;

sub new {
    my ( $class ) = @_;
    bless sub {
        my ( $content ) = @_;
        my ( $doc ) = $content =~ /<link href=".+\?doc=(.+)&amp;.+" name="media_presentation" rel="media:presentation" \/>/;
        return $doc;
    }, $class;
}

1;
