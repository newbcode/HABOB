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
my @k = qw/1 2 3 4 5/;
my $d = 0;
my $f = 4;
my $r = 5 % 4;
my @days = qw/2013-04-23 2013-04-24/;
my $first_day = '2013-04-23';
my @test;

my $c_date = `date "+%Y-%m-%d"`;
chomp ($c_date);

push @test, ("$a"."$b");
print "@test\n";
print "$test[1]\n";


