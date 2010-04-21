use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'SalesTax',
    AUTHOR              => q{Christopher H. Laco <claco@chrislaco.com>},
    VERSION_FROM        => 'lib/SalesTax.pm',
    ABSTRACT_FROM       => 'lib/SalesTax.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
        'Math::Round' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'SalesTax-*' },
);
