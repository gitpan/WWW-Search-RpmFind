#!/usr/bin/perl

use WWW::Search;
use strict;

my $moteur = 'RpmFind'; #$ARGV[0];
my $oSearch = new WWW::Search
  ($moteur,
   (
#    'debug' => 3,'_debug' => 3,
 #    'search_debug'=> 1,'search_parse_debug' => 1,
    # 'search_to_file'     => "/tmp/$moteur",
  #  'search_from_file'  => "/tmp/$moteur",
    #'proxy'=>'http://indy.alianet:3128',
   ));

#$oSearch->maximum_to_retrieve(100);

# Create request
$oSearch->native_query(WWW::Search::escape_query("cgi"),
			     { kl => 'fr' });
#			     { opt => 1 });

print "I find ", $oSearch->approximate_result_count(),"\n";
while (my $oResult = $oSearch->next_result())
  {
    print "---------------------------------\n",
	"Url    :", $oResult->url,"\n",
	"Titre  :", $oResult->title,"\n",
      "Distrib:", $oResult->description,"\n";
  }
