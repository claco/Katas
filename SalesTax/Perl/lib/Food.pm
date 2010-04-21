package Food;
use strict;
use warnings;
use base 'Item';

sub new {
    return shift->SUPER::new( shift, shift, 0 );
}

1;
