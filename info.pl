#!/usr/bin/env perl

use strict;
use warnings;
use LWP::UserAgent;
use HTTP::Cookies;
use HTTP::Request::Common;
use HTML::TokeParser::Simple;
use HTML::TokeParser;
use HTML::Query qw(Query);
use Encode;
binmode(STDOUT, ":utf8");

my $login_url = 'http://www.welstory.com/loginAction.do?%2Fmywelstory%2FmywelIndex.jsp&pwd_yn=Y&memId=&pwd=';
my $base_url = 'http://www.welstory.com/main.jsp';
my $week3_url = 'http://www.welstory.com/mywelstory/restaurant/weekMenu.jsp?mMode=21&sDate=2013-04-07&hall_no=E1B7';
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
my @test;
my ($first_day, $last_day);
my $c_date = `date "+%Y-%m-%d"`;

while ( my $td = $day_p->get_tag('td') ) {
    if ( my $td_attr = $td->get_attr('width') ) {
        if ( $td_attr == '408' ) {
            my $text = $day_p->get_trimmed_text("/td");
            my $d_text = decode("euc-kr", $text);
            ($first_day, $last_day) = $d_text =~ m/.*?(\d+-\d\d-\d\d) ~ (\d+-\d+-\d+)./;
            push @days, ($first_day);
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

my @kor_breakfast;
my @kor_lunch;
my @kor_dinner;
my @kor_temp;
my @ame_breakfast;
my @ame_lunch;
my @ame_dinner;
my @ame_temp;
my @inter_breakfast;
my @inter_lunch;
my @inter_dinner;
my @inter_temp;
my @nood_breakfast;
my @nood_lunch;
my @nood_dinner;
my @nood_temp;
my @inter2_breakfast;
my @inter2_lunch;
my @inter2_dinner;
my @inter2_temp;

my $korean_cnt = 1;
my $american_cnt = 1;
my $inter_cnt = 1;
my $noodle_cnt = 1;
my $inter2_cnt = 1;
my $course_cnt = 1;
my $kcal_cnt =1;

for (; $course_cnt <= 25; $course_cnt++) {
    if ( $course_cnt <= 5  ) {
            foreach my $today_food ( @foods ) {
                if ( $kcal_cnt == 1 ) {
                    if ( $today_food =~ /kcal$/ ) {
                        $kcal_cnt++;
                    }
                    else {
                        push @kor_breakfast, $today_food;
                    }
                }
                elsif ( $kcal_cnt == 2 ) {
                    if ( $today_food =~ /kcal$/ ) {
                        $kcal_cnt++;
                    }
                    else {
                        push @kor_lunch, $today_food;
                    }
                }
                elsif ( $kcal_cnt == 3 ) {
                    if ( $today_food =~ /kcal$/ ) {
                        $kcal_cnt++;
                    }
                    else {
                        push @kor_dinner, $today_food;
                    }
                }
                elsif ( $kcal_cnt == 4 ) {
                    if ( $today_food =~ /kcal$/ ) {
                        $kcal_cnt++;
                    }
                    else {
                        push @kor_temp, $today_food;
                    }
                }
            }
        }
=pod
    elsif ( $course_cnt <= 10  ) {
            foreach my $today_food ( @foods ) {
                if ( $kcal_cnt == 5 ) {
                    if ( $today_food =~ /kcal$/ ) {
                        $kcal_cnt++;
                    }
                    else {
                        push @ame_breakfast, $today_food;
                    }
                }
                elsif ( $kcal_cnt == 6 ) {
                    if ( $today_food =~ /kcal$/ ) {
                        $kcal_cnt++;
                    }
                    else {
                        push @ame_lunch, $today_food;
                    }
                }
                elsif ( $kcal_cnt == 7 ) {
                    if ( $today_food =~ /kcal$/ ) {
                        $kcal_cnt++;
                    }
                    else {
                        push @ame_dinner, $today_food;
                    }
                }
                elsif ( $kcal_cnt == 8 ) {
                    if ( $today_food =~ /kcal$/ ) {
                        $kcal_cnt++;
                    }
                    else {
                        push @ame_temp, $today_food;
                    }
                }
            }
        }
=cut
}

print "@kor_breakfast\n";
print "@kor_lunch\n";
print "@kor_dinner\n";
print "@kor_temp\n";
print "@ame_breakfast\n";
