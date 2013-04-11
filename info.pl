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
#binmode(STDOUT, ":utf8");
#use encoding 'utf8';

my $login_url = 'http://www.welstory.com/loginAction.do?%2Fmywelstory%2FmywelIndex.jsp&pwd_yn=Y&memId=&pwd=';
my $base_url = 'http://www.welstory.com/main.jsp';
my $week3_url = 'http://www.welstory.com/mywelstory/restaurant/weekMenu.jsp?mMode=21&sDate=2013-04-07&hall_no=E1B7';
my $html = 'welstory.html';

my $ua = LWP::UserAgent->new;
my $response;
my $cookies = new HTTP::Cookies;
$ua->cookie_jar({});
$response = $ua->get($base_url);
$response = $ua->get($login_url);
#$response = $ua->get($week_url);
$response = $ua->get($week3_url, ":content_file" => "$html");
#$response = $ua->get($week3_url);
=pod
if ( $response->is_success ) {
    print $response->decoded_content;
    #$d_Html = $response->decoded_content;
}
else {
    die $response->status_line;
}
#my $p = HTML::TokeParser::Simple->new("welstory.html") or die "Can't Open welstory.html :$!";
#<td width="52" align="center" valign="middle" class="14 b 72634D" style="border-right:1px solid #E5E0D9; border-bottom:1px solid #E5E0D9>;"
#my $parser = HTML::TokeParser::Simple->new(\*DATA);
=cut
my $day_p = HTML::TokeParser::Simple->new( $html );
my @days;

while ( my $td = $day_p->get_tag('td') ) {
    if ( my $td_attr = $td->get_attr('width') ) {
        #my $text = $parser->get_trimmed_text("/td");
        if ( $td_attr eq '408' ) {
            push @days, $td_attr;
            #print $td->as_is;
            my $text = $day_p->get_trimmed_text("/td");
            my $d_text = decode("euc-kr", $text);
            #my $string = decode("UTF-8", $kor)
            print "$text\n";
            print "$d_text\n";
        }
        #print "$td_attr\n";
    }
}
=pod
my $docName = "welstory.html";
#my $ddocName = qx |cat $docName|;
#my $dddocName = Encode::decode("euc-kr", $ddocName);
#$txt = Encode::decode("euc-kr", $txt);
my $doc = Query(file => $docName);
for my $tr ($doc->query("td")) {
  for my $td (Query($tr)->query("td")) {
      # $td is now an HTML::Element object for the td element
          print $td->as_text, "\n";
            }
}

__DATA__
<table width="100%" border="0" cellspacing="0" cellpadding="0">                                                            
               <tr>
                       <td height="16" class="11">ㆍ쇠고기대파해장국</td>
               </tr>
               <tr>
                       <td height="16" class="11">ㆍ비엔나소시지케첩볶음</td>
               </tr>
               <tr>
                       <td height="16" class="11">ㆍ깻잎지절임</td>
               </tr>
               <tr>
                       <td height="16" class="11">ㆍ포기김치</td>
               </tr>
               <tr>
                       <td height="16" class="11">ㆍ쌀밥</td>
               </tr>
 </table>


