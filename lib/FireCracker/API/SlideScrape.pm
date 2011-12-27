package FireCracker::API::SlideScrape;
use strict;

sub new {
    my ( $class ) = @_;
    bless sub {
        my ( $content ) = @_;
        my $data = {};
        ( $data->{doc} ) = $content =~ /<link href=".+\?doc=(.+)&amp;.+" name="media_presentation" rel="media:presentation" \/>/;
        ( $data->{title} ) = $content =~ /<meta name="title" property="media:title" content="(.+)" \/>/;
        ( $data->{description} ) = $content =~ /<meta name="description" property="dc:description" content="(.+)" \/>/;
        ( $data->{author} ) = $content =~ /<meta name="dc_creator" property="dc:creator" content="(.+)" \/>/;
        return $data;
    }, $class;
}

1;
