use Test::More;
use FireCracker::API::SlideScrape;
use Furl;

subtest slidescrape => sub {
    my $scraper = FireCracker::API::SlideScrape->new;
    my $agent = Furl->new;
    my $res = $agent->get( 'http://www.slideshare.net/ytnobody/prototypebased-oop' );
    is $res, 'hachiojipm2ltytnobody-110219012225-phpapp02';
};

done_testing;
