#!/usr/bin/env perl

use strict;
use warnings;
use LWP::UserAgent;
use HTTP::Cookies;
use HTTP::Request::Common;

#my $login_url = 'http://www.welstory.com/loginAction.do';
#my $login_url = 'https://www.welstory.com:3443/common/login_ssl.jsp?eURL=';
my $base_url = 'http://www.welstory.com/main.jsp';
my $week_url = 'http://www.welstory.com/mywelstory/restaurant/todayMenu.jsp?mMode=21';
my $week1_url = 'http://www.welstory.com/mywelstory/restaurant/weekMenu.jsp?hall_no=E1B7&sDate_millis=1365260400000';
my $week2_url = 'http://www.welstory.com/mywelstory/restaurant/weekMenu.jsp?hall_no=E1B7&sDate_millis=1365865200000';
my $week3_url = 'http://www.welstory.com/mywelstory/restaurant/weekMenu.jsp?mMode=21&sDate=2013-04-07&hall_no=E1B7';

my $ua = LWP::UserAgent->new;
my $response;
my $cookies = new HTTP::Cookies;
$ua->cookie_jar({});
$response = $ua->get($base_url);
$response = $ua->get($login_url);
#$response = $ua->get($week_url);
$response = $ua->get($week3_url, ":content_file" => 'welstory.html');
#$ua->request(POST $login_url, [memId => $memid, pwd => $pwd]);
=pod
$response = $ua->post($login_url,
  [
        pwd_yn => $pwd_yn,
        memId   => $memid,
        pwd    => $pwd,
  ],
);
=cut

if ( $response->is_success ) {
    print $response->decoded_content;
}
else {
    die $response->status_line;
}
