#!/usr/bin/perl -w

use strict;
use warnings;
use diagnostics;

use feature 'say';
use feature 'switch';

use v5.30;

use locale;
use utf8;
use open IO => ':utf8', ':std';


my $prefix_length = pop @ARGV;
my %prefix_to_count;

while(my $line = <>) {
    chomp($line);
    my @words = split " ", $line;
    for my $word (@words) {
        $word =~ s/^[\W]+|[\W]+$|//g;
        if (length $word >= $prefix_length) {
            my $prefix = substr lc($word), 0, $prefix_length;
            if (exists $prefix_to_count{$prefix}) {
                $prefix_to_count{$prefix} += 1
            } else {
                $prefix_to_count{$prefix} = 1
            }
        }
    }
}

my @keys = sort keys(%prefix_to_count);
for(@keys){say  "$_:$prefix_to_count{$_}"}