use inc::Module::Install;

name 'BowlingGame';
all_from 'lib/BowlingGame.pm';
author q{Christopher H. Laco <claco@chrislaco.com>};
license 'perl';

build_requires 'Test::More';

auto_install;

WriteAll;

