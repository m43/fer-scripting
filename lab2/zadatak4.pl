#!/usr/bin/perl -w

use strict;
use warnings;
use diagnostics;

use feature 'say';
use feature 'switch';

use v5.30;


while(my $line = <>) {
    if ($line =~ m/^JMBAG/) {
        next;
    }
    my @line_parts = split ";", $line;
    
    my @time1_parts = split " ", $line_parts[3];
    my @time1_hms = split ":", $time1_parts[1] . ":00";
    my $time1 = $time1_hms[0]*3600 + $time1_hms[1]*60 + $time1_hms[2];
    
    my @time2_parts = split " ", $line_parts[4];
    my @time2_hms = split ":", $time2_parts[1];
    my $time2 = $time2_hms[0]*3600 + $time2_hms[1]*60 + $time2_hms[2];

    # NOTE: I'll take the preassumption that no lab takes place around midnight!
    if (($time1_parts[0] ne $time2_parts[0]) or ($time2 > $time1+3600)) {
        say "$line_parts[0] $line_parts[1] $line_parts[2] - PROBLEM: $time1_parts[0] $time1_parts[1] --> $time2_parts[0] $time2_parts[1]" 
    }
}

# 0036433049 Bajac Darko - PROBLEM: 2011-03-14 08:00 --> 2011-03-14 18:48:19
# 0036433049 Bajac Darko - PROBLEM: 2011-03-14 08:00 --> 2011-03-14 20:48:19
# 0036436684 Lombarović Mladen - PROBLEM: 2011-03-14 11:00 --> 2011-03-14 12:08:26
# 0036325839 Matošić Luka - PROBLEM: 2011-03-14 11:00 --> 2011-03-15 11:49:26