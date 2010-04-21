package Order;
use strict;
use warnings;

sub new {
    return bless { items => [] }, shift;
}

sub add {
    push @{ shift->{items} }, shift;
}

sub items {
    return @{ shift->{items} };
}

1;
