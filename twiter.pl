#!/usr/bin/env perl 

#use strict;
#use warnings;
use Net::Twitter::Lite

$consumer_key = '';
$consumer_secret = '';
$access_token = '';
$access_token_secret = '';

my $nt = Net::Twitter::Lite->new(
    # 위에서 메모해 둔 네 가지 필드값을
    # 아래 네 줄에 변수들이 적힌 자리에 각각 적어줍니다.
    consumer_key        => $consumer_key,
    consumer_secret     => $consumer_secret,
    access_token        => $access_token,
    access_token_secret => $access_token_secret,
);
 
my $result = eval { $nt->update('Hello, World! BOBOBOBO') };
warn "$@\n" if $@;
