#!/usr/bin/env perl 

use strict;
use warnings;
use HTML::TokeParser::Simple;
use HTML::TableContentParser;

#my $p = HTML::TokeParser::Simple->new("welstory.html") or die "Can't Open welstory.html :$!";
=pod
my $tag = $p->get_tag("td");
if ( $tag->[1]{width} and $tag->[2]{align} and $tag->[3]{valign} and $tag->[4]{class}) and $tag->[5]{style} eq "border-right:1px solid #E5E0D9; border-bottom:1px solid #E5E0D9;") {
    $day = $p->get_trimmed_text("/td");
    print "$day\n";
}
#<td width="52" align="center" valign="middle" class="14 b 72634D" style="border-right:1px solid #E5E0D9; border-bottom:1px solid #E5E0D9>;"
=cut

#my $parser = HTML::TokeParser::Simple->new(\*DATA);
my $parser = HTML::TokeParser::Simple->new("welstory.html");

my @hrefs;

while ( my $anchor = $parser->get_tag('td') ) {
    if ( my $href = $anchor->get_attr('width') ) {
        #my $text = $parser->get_trimmed_text("/td");
        if ( $href eq '408' ) {
            #push @hrefs, $href;
            #print $anchor->as_is;
            my $text = $parser->get_trimmed_text("/td");
            print "$text\n";
        }
        #print "$href\n";
    }
}
#print "$_\n" for @hrefs;

__DATA__
<td width="408" class="verdana 11 72634d"><img src="/img/common/bul_01.gif" align="absmiddle"> 기간 : <a href="javascript:prevWEEK('1364655     600000');">◀</a> 2013-04-01 ~ 2013-04-07<a href="javascript:nextWEEK('1365865200000');">▶</a></td>
