#!/usr/bin/env perl 

#use strict;
#use warnings;
use Net::Twitter::Lite

$consumer_key = 'p7dD6cKiKzxQj2sRvUExEA';
$consumer_secret = 'HubMLKVSR67obw1z3AYE224deQeKhevA7W0Vmm4lpbI';
$access_token = '1349393743-ZUwuWUWUN2sGVtTfE7y9smUny3PREjuVfWsNCrU';
$access_token_secret = 'CdA1SV0sRSzNo2hDjdqKGSWECdzFjtq35DctceCgq8';

my $nt = Net::Twitter::Lite->new(
    consumer_key        => $consumer_key,
    consumer_secret     => $consumer_secret,
    access_token        => $access_token,
    access_token_secret => $access_token_secret,
    legacy_lists_api => 0,
);
 
my @test = qw/189 898 09818 091380 9801938 09/;
#my $result = eval { $nt->update("@test") };
#warn "$@\n" if $@;
my $result = eval { $nt->update("@test") };
warn "$@\n" if $@;
