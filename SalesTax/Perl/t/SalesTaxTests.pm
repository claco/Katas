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

sub set_item_defaults : Tests(2) {
    my $item = Item->new( 14.99, 1 );
    is( $item->price,   14.99 );
    is( $item->taxable, 1 );
}

1;
