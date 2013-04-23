#!/usr/bin/env perl 

#use strict;
#use warnings;
use Net::Twitter::Lite

$consumer_key = '';
$consumer_secret = '';
$access_token = '';
$access_token_secret = '';
$consumer_key = '';
$consumer_secret = '';
$access_token = '';
$access_token_secret = '';

my $nt = Net::Twitter::Lite->new(
    consumer_key        => $consumer_key,
    consumer_secret     => $consumer_secret,
    access_token        => $access_token,
    access_token_secret => $access_token_secret,
    legacy_lists_api => 0,
);
 
my @test = qw/1 2 3 4 5 8 89 89 89 898 098190809218 091380 9801938 09/;
#my $result = eval { $nt->update("@test") };
#warn "$@\n" if $@;
my $result = eval { $nt->update("@test") };
warn "$@\n" if $@;
