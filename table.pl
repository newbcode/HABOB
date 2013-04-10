#!/usr/bin/env perl 

#use strict;
#use warnings;
use HTML::TokeParser::Simple;
use HTML::TableContentParser;
use HTML::TableExtract;
use HTML::Query qw(Query);
use Encode;
use encoding 'utf8';

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

