package Order;
use strict;
use warnings;
use Math::Round;

sub new {
    return bless { items => [], tax => 0, total => 0 }, shift;
}

sub add {
    push @{ shift->{items} }, shift;
}

sub items {
    return @{ shift->{items} };
}

sub calculate {
    my $self = shift;
    
    $self->{tax} = 0;
    $self->{total} = 0;

    foreach ($self->items) {
        $self->{total} += $_->price;

        if ($_->taxable) {
            $self->{tax} += nearest(.01, $_->price * 0.10);
            $self->{total} += $self->{tax};
        }
    }
}

sub tax {
    shift->{tax};
}

sub total {
    shift->{total};
}

sub receipt {
    my $self = shift;
    my $receipt = "\n";

    foreach ($self->items) {
        $receipt .=  '1 ' . $_->name . ' at ' . $_->price . "\n";
    }
    $receipt .= 'Sales Taxes: ' . $self->tax . "\n";
    $receipt .= 'Total: ' . $self->total . "\n";

    return $receipt;
}

1;
