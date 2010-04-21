package SalesTaxTests;
use base 'Test::Class';
use Test::More;
use Order;

sub have_order : Test {
    isa_ok( Order->new, 'Order' );
}

1;
