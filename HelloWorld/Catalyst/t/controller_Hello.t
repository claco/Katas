use strict;
use warnings;
use Test::More tests => 5;

BEGIN { use_ok 'Catalyst::Test', 'HelloWorld' }
BEGIN { use_ok 'HelloWorld::Controller::Hello' }

ok( request('/hello')->is_success, 'Request should succeed' );
like( get('/hello'), qr/hello world/, 'contains default greeting');
like( get('/hello/chris'), qr/hello chris/, 'contains specified greeting');
