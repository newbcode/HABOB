#!/usr/bin/env perl

use strict;
use warnings;

my $a = 0;
foreach ( qw/1 2 3 4 5/ ) {
    $a += 20;
    print "$a\n";
}

=pod
my $date_check = `date "+%a"`;
chomp $date_check;
my $c_date = `date "+%Y-%m-%d"`;
chomp $c_date;

print "$date_check";
print "$c_date\n";

if ( $date_check eq 'Mon') {
    print "OK\n";
}
else {
    print "NO\n";
}

my $first_day = '2013-04-30';
my @days;

foreach my $new_date ( qw/a 1 2 3 4/ ) {
    if ( $new_date eq 'a' ) {
        push @days, $first_day;
    }
    else {
        my $today_date = `date -d '$first_day + $new_date day' "+%Y-%m-%d"`;
        chomp $today_date;
        push @days, $today_date;
    }
}

print "@days\n";

foreach ( @days ) {
    if ( $c_date eq $_ ) {
        print "OK $_\n";
    }
}

foreach ( @days ) {
    if ( $c_date eq $_ ) {
        print "OK $_\n";
    }
}

print "
