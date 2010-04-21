package Item;
use strict;
use warnings;

sub new {
    my ($class, $price, $taxable) = @_;

    return bless {price => $price, taxable => $taxable}, $class;
}

sub price {
    return shift->{price};
}

sub taxable {
    return shift->{taxable};
}

1;