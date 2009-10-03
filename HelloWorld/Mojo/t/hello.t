#!/usr/bin/env perl

use strict;
use warnings;

use Mojo::Client;
use Mojo::Transaction::Single;
use Test::More tests => 7;

use_ok('HelloWorld');

{
    # Prepare client and transaction
    my $client = Mojo::Client->new;
    my $tx     = Mojo::Transaction::Single->new_get('/hello');

    # Process request
    $client->process_app('HelloWorld', $tx);

    # Test response of default greeting
    is($tx->res->code, 200);
    is($tx->res->headers->content_type, 'text/html');
    like($tx->res->content->asset->slurp, qr/hello world/i);
}

{
    # Prepare client and transaction
    my $client = Mojo::Client->new;
    my $tx     = Mojo::Transaction::Single->new_get('/hello/chris');

    # Process request
    $client->process_app('HelloWorld', $tx);

    # Test response of default greeting
    is($tx->res->code, 200);
    is($tx->res->headers->content_type, 'text/html');
    like($tx->res->content->asset->slurp, qr/hello chris/i);
}