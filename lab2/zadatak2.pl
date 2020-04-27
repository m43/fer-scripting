#!/usr/bin/perl -w

use strict;
use warnings;
use diagnostics;

use feature 'say';
use feature "switch";

use v5.30;

my @argh;
my @stop_words = ("STOP", "stop", "kukac", "s");
my $stop_flag = 0;
while(!$stop_flag) {
    print "Enter a number or one of these{"
            . join(",", @stop_words)
            . "}: ";
    my $line = <STDIN>;
    chomp $line;
    
    for(@stop_words) {
        if($line eq $_) {
            $stop_flag = 1;
        }
    }

    if($stop_flag) {
        last;
    }

    # TODO what if not a number
    $argh[$#argh+1] = $line;
}

if($#argh == -1) {
    print "No numbers entered.";
} else {
    my $sum = 0;
    for(@argh) {
        $sum += $_;
    }
    print $#argh;
    my $mean = $sum / ($#argh + 1);

    print "\n\nGot ".($#argh+1).($#argh==0?" number":" numbers")." entered\n"
        . "Sum: ${sum}\n"
        . "Mean: ${mean}\n";
}