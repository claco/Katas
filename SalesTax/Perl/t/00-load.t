#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'SalesTax' ) || print "Bail out!
";
}

diag( "Testing SalesTax $SalesTax::VERSION, Perl $], $^X" );
