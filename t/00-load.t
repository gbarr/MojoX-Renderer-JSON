#!perl -T

use Test::More tests => 1;

BEGIN {
        use_ok( 'MojoX::Renderer::JSON' );
}

diag( "Testing MojoX::Renderer::JSON $MojoX::Renderer::JSON::VERSION, Perl $], $^X" );
