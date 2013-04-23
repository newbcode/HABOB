#!/usr/bin/env perl 

#use strict;
#use warnings;
use Net::Twitter::Lite

$consumer_key = '';
$consumer_secret = '';
$access_token = '';
$access_token_secret = '';

my $nt = Net::Twitter::Lite->new(
    consumer_key        => $consumer_key,
    consumer_secret     => $consumer_secret,
    access_token        => $access_token,
    access_token_secret => $access_token_secret,
);
 
my @test = qw/1 2 3 4 5/;
=pod
foreach ( @test ) {
    my $result = eval { $nt->update("") };
}
=cut
my $result = eval { $nt->update("$test[5]"."@test") };
