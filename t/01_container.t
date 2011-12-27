use Test::More;
use FireCracker::Container;

subtest bootstrap => sub {
    my $container = FireCracker::Container->bootstrap;
    isa_ok $container->get('Furl'), 'Furl';
    isa_ok $container->get('API::SlideScrape'), 'FireCracker::API::SlideScrape';
};

done_testing;
