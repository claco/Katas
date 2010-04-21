package Item;
use strict;
use warnings;

sub new {
    my ( $class, $name, $price, $taxable ) = @_;

    return bless {
        name  => $name  || 'Untitled',
        price => $price || 0.00,
        tax => 0,
        total => 0,
        taxable => defined($taxable) ? $taxable : 1
    }, $class;
}

sub name {
    return shift->{name};
}

sub price {
    return shift->{price};
}

sub tax {
    return shift->{tax};
}

sub taxable {
    return shift->{taxable};
}

sub total {
    return shift->{total};
}

1;
