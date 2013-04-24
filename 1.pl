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


my $t_date = `date "+%T"`;
my @tt_date = split /:/, $t_date;
print "@tt_date\n";
