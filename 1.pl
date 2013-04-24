#!/usr/bin/perl 
#===============================================================================
#
#         FILE:  1.pl
#
#        USAGE:  ./1.pl 
#
#  DESCRIPTION:  
#
#      OPTIONS:  ---
# REQUIREMENTS:  ---
#         BUGS:  ---
#        NOTES:  ---
#       AUTHOR:   (), <>
#      COMPANY:  
#      VERSION:  1.0
#      CREATED:  04/17/2013 10:35:09 PM KST
#     REVISION:  ---
#===============================================================================

use strict;
use warnings;

my @days = qw/2013-04-23 2013-04-24/;

test(1, 2, @days);

sub test {
    my ( $a, $b, @c ) = @_;
    print "$a\n";
    print "$b\n";
    print "@c\n";
}
