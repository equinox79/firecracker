use ExtUtils::MakeMaker;

WriteMakefile(
    NAME => 'FireCracker',
    PREREQ_PM => {
        'Tatsumaki'         => 0,
        'HTML::Entities'    => 0,
        'Plack'             => 0,
        'Time::HiRes'       => 0,
        'Test::More'        => 0.90,
        'Mouse'             => 0, 
        'MouseX::Foreign'   => 0,
        'Object::Container' => 0,
        'Furl'              => 0,
    },
);
