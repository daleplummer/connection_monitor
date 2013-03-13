#! /usr/bin/perl

use strict;
use warnings;

my $filename = "./monitor_network.log";
my $filesize;
my $return;
my $remotehostname = "statcomp2.vanderbilt.edu";
my $count = 0;

open (OUT2, ">run.log");
open (OUT,">>monitor_network.log");
while(1)
{
   print OUT2 $count++ . "\n";
   print $count . "\n";
   $filesize = -s $filename;
#   print OUT "filesize " . $filesize . "\n";
   print OUT "------------------------------------------------------------ \n";
   system("date >> monitor_network.log");
   $return = system("ping -c 1 $remotehostname >> monitor_network.log");

   if($return != 0)
    {
      print OUT $remotehostname . " not reachable " . (localtime) . "\n";
      #print $remotehostname . " not reachable\n\n";
      #exit();
    }
   elsif ($filesize > 5000000000)
    {
      print OUT "Log file is 5Mb large--program ending.\n";
      print "Log file is 5Mb large--program ending.\n";
      exit();
    }
   else
    {
      print OUT "\n";
    }
   print OUT "------------------------------------------------------------ \n";
   sleep(10);
}
close (OUT);
close (OUT2);
