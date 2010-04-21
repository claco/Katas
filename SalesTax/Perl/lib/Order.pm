package Order;
use strict;
use warnings;
use Math::Round;

sub new {
    return bless { items => [], tax => 0, total => 0 }, shift;
}

sub add {
    push @{ shift->items }, shift;
}

sub items {
    return shift->{items};
}

sub calculate {
    my $self = shift;

    $self->{tax}   = 0;
    $self->{total} = 0;

    foreach ( @{ $self->items } ) {
        if ( $_->taxable ) {
            $_->{tax} = nearest( .05, ($_->price*10)/100 );
        }

        if ( $_->name =~ /imported/i ) {
            $_->{tax} += nearest( .05, ($_->price*5)/100 );
        }

        $_->{total} = $_->{tax} + $_->{price};

        $self->{tax}   += $_->{tax};
        $self->{total} += $_->{total};
    }
}

sub tax {
    shift->{tax};
}

sub total {
    shift->{total};
}

sub receipt {
    my $self    = shift;
    my $receipt = "\n";

    foreach ( @{ $self->items } ) {
        $receipt .= '1 ' . $_->name . ' at ' . $_->total . "\n";
    }
    $receipt .= 'Sales Taxes: ' . $self->tax . "\n";
    $receipt .= 'Total: ' . $self->total . "\n";

    return $receipt;
}

1;
