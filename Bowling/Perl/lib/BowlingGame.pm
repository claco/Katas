package BowlingGame;
use strict;
use warnings;

sub new {
    return bless { rolls => [] }, shift;
}

sub roll {
    push @{ shift->{rolls} }, shift;
}

sub score {
    my $total = 0;
    my @rolls = @{ shift->{rolls} };

    for ( 1 .. 10 ) {
        my $pins = shift @rolls;

        if ( $pins == 10 ) {
            $total += $pins + $rolls[0] + $rolls[1];
        } elsif ( $pins + $rolls[0] == 10 ) {
            $total += $pins + shift(@rolls) + $rolls[0];
        } else {
            $total += $pins + shift(@rolls);
        }
    }

    return $total;
}

1;
