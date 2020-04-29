#!/usr/bin/perl -w

use strict;
use warnings;
use diagnostics;

use feature 'say';
use feature "switch";

use v5.30;


print "Enter a string: ";
my $str = <STDIN>;
chomp $str;
$str .= "\n";

print "Enter number of repetitions: ";
my $rep = <STDIN>;
chomp $rep;

print $str x $rep;
