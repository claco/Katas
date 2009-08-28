package BolingTests::Tests;
use base qw(Test::Class);
use Test::More;
use BowlingGame;

my $game;

sub before : Test(setup) {
    $game = BowlingGame->new;
}

sub exists : Test {
    isa_ok( $game, 'BowlingGame' );
}

sub roll {
    rollMany( 1, shift );
}

sub rollMany {
    my ( $rolls, $pins ) = @_;

    for ( 1 .. $rolls ) {
        $game->roll($pins);
    }
}

sub test_gutter_game : Test {
    rollMany( 20, 0 );

    is( $game->score, 0 );
}

sub test_all_ones : Test {
    rollMany( 20, 1 );

    is( $game->score, 20 );
}

sub test_one_spare : Test {
    roll(3);
    roll(7);
    roll(3);
    rollMany( 17, 0 );

    is( $game->score, 16 );
}

sub test_one_strike : Test {
    roll(10);
    roll(3);
    roll(4);
    rollMany( 16, 0 );

    is( $game->score, 24 );
}

sub test_perfect_game : Test {
    rollMany( 12, 10 );

    is( $game->score, 300 );
}

1;
