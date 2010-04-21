package Item;
use strict;
use warnings;

sub new {
    my ( $class, $name, $price, $taxable ) = @_;

    return bless {
        name  => $name  || 'Untitled',
        price => $price || 0.00,
        taxable => defined($taxable) ? $taxable : 1
    }, $class;
}

sub name {
    return shift->{name};
}

sub price {
    return shift->{price};
}

sub taxable {
    return shift->{taxable};
}

1;
