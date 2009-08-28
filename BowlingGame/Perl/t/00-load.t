#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok('BowlingGame');
}

diag("Testing BowlingGame $BowlingGame::VERSION, Perl $], $^X");
