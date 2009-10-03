package HelloWorld::Hello;

use strict;
use warnings;

use base 'Mojolicious::Controller';

# This action will render a template
sub index {
    my $self = shift;
    my $greeting = $self->stash('greeting') || 'world';

    # Render template "example/welcome.html.epl" with message and layout
    $self->render(
        layout  => 'default',
        message => "hello $greeting",
    );
}

1;
