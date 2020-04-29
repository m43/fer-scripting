#!/usr/bin/perl -w

use strict;
use warnings;
use diagnostics;

use feature 'say';
use feature 'switch';

use v5.30;


my $was_first = 0;
my @weights;
my @students;
while(my $line = <>) {
    chomp($line);
    if ($line =~ m/^#/) {
        next;
    }
    
    if (!$was_first) {
        $was_first = 1;
        @weights = split ";", $line;
        next;
    }

    push @students, $line;
}

sub calculate_points {
    my @student = split ";", $_[0];

    my $result = 0;
    for (0..$#weights) {
        if ($student[$_+3] eq "-") {
            next;
        }
        $result += $weights[$_] * $student[$_+3];
    }
    
    $result;
}

@students = sort {&calculate_points($b) <=> &calculate_points($a)} @students;

say "Rang list:";
say "-" x 20;
my $counter = 1;
foreach(@students) {
    my @parts = split ";", $_;
    printf "%3d. %-32s : %6.2f\n", $counter,"$parts[1], $parts[2] ($parts[0])", calculate_points $_;
    $counter += 1;
}

# Lista po rangu:
# -------------------
#   1. Bagarić, Magdalena (0036438919)  : 90.35
#   2. Pavlinovi ́c, Matija (0036427706) : 82.20
#   3. Bandalo, Danijel (0067400961)    : 72.94
#   ...
#   13. Lombarovi ́c, Mladen (0036436684)    : 19.86...
#   ...