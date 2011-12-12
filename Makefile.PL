use ExtUtils::MakeMaker;

WriteMakefile(
    PREREQ_PM => {
        'Tatsumaki'      => 0,
        'HTML::Entities' => 0,
        'Plack'          => 0,
        'Time::HiRes'    => 0,
    }
);
