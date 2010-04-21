package SalesTaxTests;
use base 'Test::Class';
use Test::More;
use Order;
use Item;

sub have_order : Test {
    isa_ok( Order->new, 'Order' );
}

sub create_item : Test {
    isa_ok( Item->new, 'Item' );
}

1;
