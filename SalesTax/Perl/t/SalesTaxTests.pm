package SalesTaxTests;
use base 'Test::Class';
use Test::More;
use Order;
use Item;
use Food;
use Book;
use Medical;

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
    is( scalar @{$order->items}, 1 );
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

sub have_medical : Test {
    my $medical = Medical->new;
    isa_ok( $medical, 'Medical' );
}

sub medical_is_not_taxable : Test {
    my $medical = Medical->new;
    ok( !$medical->taxable );
}

sub item_has_tax : Test {
    my $item = Item->new;
    is( $item->tax, 0 );
}

sub item_has_total : Test {
    my $item = Item->new;
    is( $item->total, 0 );
}

##########################
# INPUT/OUTPUT Tests
##########################

sub input_1 : Tests {
    $order->add( Book->new( 'book',          12.49 ) );
    $order->add( Item->new( 'music CD',      14.99 ) );
    $order->add( Food->new( 'chocolate bar', 0.85 ) );

    $order->calculate();

    is( $order->items->[0]->total, 12.49);
    is( $order->items->[1]->total, 16.49);
    is( $order->items->[2]->total, 0.85);
    
    is( $order->tax,   1.50 );
    is( $order->total, 29.83 );

    diag $order->receipt;
}

1;
