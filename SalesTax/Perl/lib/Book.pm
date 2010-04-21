package Book;
use strict;
use warnings;
use base 'Item';

sub new {
    return shift->SUPER::new( shift, shift, 0, @_ );
}

1;
