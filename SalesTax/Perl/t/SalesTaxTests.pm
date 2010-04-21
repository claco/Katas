package SalesTaxTests;
use base 'Test::Class';
use Test::More;
use Order;
use Item;

my $order;

sub before : Test(setup) {
    $order = Order->new;
}

sub have_order : Test {
    isa_ok( $order, 'Order' );
}

sub create_item : Test {
    isa_ok( Item->new, 'Item' );
}

sub set_item_defaults : Tests(3) {
    my $item = Item->new( 'My Item', 14.99, 1 );
    is( $item->name,    'My Item' );
    is( $item->price,   14.99 );
    is( $item->taxable, 1 );
}

1;
