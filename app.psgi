use lib 'lib';
use Plack::Builder;

use Data::Dump qw(pp);
my $app = sub {
    my $env = shift;
    [ 200, [ 'Content-Type' => 'text/plain' ], [ pp($env) ] ];
};

builder {
    enable "SimpleLogger", level => "warn";
    enable "Cerberus",
        servers => 'http://localhost:5001',
        log_as  => 'info',
        enforce => 1;
    $app;
};
