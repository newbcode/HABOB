#!/usr/bin/env perl

use strict;
use warnings;
use LWP::UserAgent;
use HTTP::Cookies;
use HTTP::Request::Common;
use HTML::TokeParser::Simple;
use HTML::TokeParser;
use HTML::Query qw(Query);
use Encode qw(encode decode);
use Net::Twitter::Lite
binmode(STDOUT, ":utf8");

my $login_url = 'http://www.welstory.com/loginAction.do?%2Fmywelstory%2FmywelIndex.jsp&pwd_yn=Y&memId=&pwd=';
my $base_url = 'http://www.welstory.com/main.jsp';
my $week3_url = 'http://www.welstory.com/mywelstory/restaurant/weekMenu.jsp?mMode=21&sDate=2013-04-22&hall_no=E1B7';
my $html = 'welstory.html';

=pod
my $ua = LWP::UserAgent->new;
my $response;
my $cookies = new HTTP::Cookies;
$ua->cookie_jar({});
$response = $ua->get($base_url);
$response = $ua->get($login_url);
#$response = $ua->get($week_url);
$response = $ua->get($week3_url);
if ( $response->is_success ) {
    $response = $ua->get($week3_url, ":content_file" => "$html");
}
else {
    die $response->status_line;
}
=cut
my $day_p = HTML::TokeParser::Simple->new( $html );
my @days;
my @seq_days;
my @course;
my @foods;
my @tweet;
my ($first_day, $last_day);
my $c_date = `date "+%Y-%m-%d"`;
chomp $c_date;

while ( my $td = $day_p->get_tag('td') ) {
    if ( my $td_attr = $td->get_attr('width') ) {
        if ( $td_attr == '408' ) {
            my $text = $day_p->get_trimmed_text("/td");
            my $d_text = decode("euc-kr", $text);
            ($first_day, $last_day) = $d_text =~ m/.*?(\d+-\d\d-\d\d) ~ (\d+-\d+-\d+)./;
        }
        elsif ( $td_attr eq '52' ) {
            if ( my $a_day_attr = $td->get_attr('align') ) {
                if ( $a_day_attr eq 'center' ) {
                    my $ss_day = $day_p->get_trimmed_text("/td");
                    my $d_ss_day = decode("euc-kr", $ss_day);
                    next if $d_ss_day eq '[IMG]';
                    push @seq_days, $d_ss_day;
                }
            }
        }
        elsif ( $td_attr eq '55' ) {
            if ( my $c_attr = $td->get_attr('align') ) {
                if ( $c_attr eq 'center' ) {
                    my $c_day = $day_p->get_trimmed_text("/td");
                    my $d_c_day = decode("euc-kr", $c_day);
                    push @course, $d_c_day;
                }
            }
        }
    }
    elsif ( my $f_attr = $td->get_attr('height') ) {
        if ( $f_attr == '16' ) {
            if ( my $f_c_attr = $td->get_attr('class') ) {
                if ( $f_c_attr == '11' ) {
                    my $f_text = $day_p->get_trimmed_text("/td");
                    my $d_f_text = decode("euc-kr", $f_text);
                    push @foods, $d_f_text;
                }
            }
        }
    }
}

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

my $scalra_foods = join "", @foods;
my @new_foods = split (/kcal/, $scalra_foods);
my @ddd_today_menu;
my @today_menu = qw/아침 점심 저녁 야식/;

foreach my $d_today_menu ( @today_menu ) {
    my $dd_today_menu = decode("utf8", $d_today_menu);
    push @ddd_today_menu, $dd_today_menu;
}

my @ddd_today_menu;
my @today_menu = qw/한식 양식 분식 /;

foreach my $d_today_menu ( @today_menu ) {
    my $dd_today_menu = decode("utf8", $d_today_menu);
    push @ddd_today_menu, $dd_today_menu;
}

foreach my $day_parser ( @days ) {
    if ( $day_parser eq "$c_date" ) {
        push @tweet, ("$c_date"."  $seq_days[0]\n");
        today_food(0, 3, 'korean');
        today_food(4, 7, 'american');
        today_food(8, 11, 'inter');
        today_food(12, 15, 'noodle');
        today_food(16, 19, 'inter2');
    }
    elsif ( $day_parser eq "$c_date" ) {
        push @tweet, ("$c_date"."  $seq_days[1]\n");
        today_food(20, 23, 'korean');
        today_food(24, 27, 'american');
        today_food(28, 31, 'inter');
        today_food(32, 35, 'noodle');
        today_food(36, 39, 'inter2');
    }
    elsif ( $day_parser eq "$c_date" ) {
        push @tweet, ("$c_date"."  $seq_days[2]\n");
        today_food(40, 43, 'korean');
        today_food(44, 47, 'american');
        today_food(48, 51, 'inter');
        today_food(52, 55, 'noodle');
        today_food(56, 59, 'inter2');
    }
    elsif ( $day_parser eq "$c_date") {
        push @tweet, ("$c_date"."  $seq_days[3]\n");
        today_food(60, 63, 'korean');
        today_food(64, 67, 'american');
        today_food(68, 71, 'inter');
        today_food(72, 75, 'noodle');
        today_food(76, 79, 'inter2');
    }
    elsif ( $day_parser eq "$c_date" ) {
        push @tweet, ("$c_date"."  $seq_days[4]\n");
        today_food(80, 83, 'korean');
        today_food(84, 87, 'american');
        today_food(88, 91, 'inter');
        today_food(92, 95, 'noodle');
        today_food(96, 99, 'inter2');
    }

}

sub today_food {
    my ($init_num, $last_num, $menu) = @_;
    for (; $init_num <= $last_num; $init_num++) {
        my $div = $init_num % 4;
        if ( $div == 0 ) {
            #print "$menu: "."blackfast"."$new_foods[$init_num]\n";
            push @tweet, ("$menu "."$ddd_today_menu[0]"."$new_foods[$init_num]\n");
        }
        elsif ( $div == 1 ) {
            #print "$menu: "."lunch"."$new_foods[$init_num]\n";
            push @tweet, ("$menu "."lunch"."$new_foods[$init_num]\n");
        }
        elsif ( $div == 2 ) {
            #print "$menu: "."dinner"."$new_foods[$init_num]\n";
            push @tweet, ("$menu "."dinner"."$new_foods[$init_num]\n");
        }
        elsif ( $div == 3 ) {
            #print "$menu: "."temp"."$new_foods[$init_num]\n";
            push @tweet, ("$menu "."temp"."$new_foods[$init_num]\n");
        }
    }
}
print "@tweet\n";
#print "$tweet[20]\n";
