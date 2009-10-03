package HelloWorld::Controller::Hello;

use strict;
use warnings;
use parent 'Catalyst::Controller';

=head1 NAME

HelloWorld::Controller::Hello - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut

=head2 index

=cut

sub index : Path {
    my ( $self, $c, $greeting ) = @_;
    $greeting ||= 'world';

    $c->response->body("hello $greeting");
}

=head1 AUTHOR

Christopher H. Laco

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
