package BowlingGame;
use strict;
use warnings;

=head2 new

Creates a new game.

=cut
sub foo {

}
sub new {
    return bless { rolls => [] }, shift;
}

=head2 roll

Records a roll in the current game.

=cut

sub roll {
    push @{ shift->{rolls} }, shift;
}

=head2 score

Calculates the score of the current game.

=cut

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
