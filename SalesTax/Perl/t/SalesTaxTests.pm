package SalesTaxTests;
use base 'Test::Class';
use Test::More;
use Order;

sub have_order : Test {
    my $order = Order->new;
}

1;