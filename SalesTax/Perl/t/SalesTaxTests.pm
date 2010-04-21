package SalesTaxTests;
use base 'Test::Class';
use Test::More;
use Order;
use Item;
use Food;
use Book;

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

sub add_item_to_order : Test {
    $order->add( Item->new );
    is( scalar $order->items, 1 );
}

sub have_food : Test {
    my $food = Food->new;
    isa_ok( $food, 'Food' );
}

sub food_is_not_taxable : Test {
    my $food = Food->new;
    ok( !$food->taxable );
}

sub item_is_taxable : Test {
    my $item = Item->new;
    ok( $item->taxable );
}

sub have_book : Test {
    my $book = Book->new;
    isa_ok( $book, 'Book' );
}

sub book_is_not_taxable : Test {
    my $book = Book->new;
    ok( !$book->taxable );
}

1;
