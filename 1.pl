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



my $a = 1;
my $b =05;
my $c = $a + $b;

print "$c\n";

my @k = qw/a b c d e/;

my $t = 10;
my @d = shift @k;

print "@d\n";
print "@k\n";
