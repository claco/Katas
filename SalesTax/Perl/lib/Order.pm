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
    
}

1;
