#!/usr/bin/perl -w

use strict;
use warnings;
use diagnostics;

use feature 'say';
use feature 'switch';

use v5.30;


if($#ARGV > 0) {
    die "At most one file name can be given (If none is given,"
    . "the program reads from STDIN). Got $#ARGV arguments!\n";
}

my %index_to_count;
my $line_index = -1;
my $line_counter = 0;
while(<>) {
    $line_counter++;
    if (/^From nobody/) {
        if($line_index != -1) {
            $index_to_count{$line_index} = $line_counter - $line_index - 1;
            $line_index = $line_counter;
        } else {
            $line_index = $line_counter;
        }
    }
}

if($line_index != -1) {
    $index_to_count{$line_index} = $line_counter - $line_index;
    $line_index = $line_counter;
}


my @keys_sorted_by_line_count = sort {$index_to_count{$b} <=> $index_to_count{$a}} keys %index_to_count;
my $printed_out_count = 0;
foreach my $key (@keys_sorted_by_line_count) {
    printf("%d: %d\n", $key, $index_to_count{$key});
    $printed_out_count += 1;
    if ($printed_out_count == 40) {
        last;
    }
}

## Assignment:

# U datoteci koja se zadaje kao argument pri pozivu skripte
# pohranjene su mail poruke razmjenjivane preko jedne
# distribucijske liste. Svaka poruka započinje tekstom
# "From nobody ", nakon čega slijede ostali retci poruke.
# Primjer datoteke s arhivom poruka je 2017-04.mail.

# Napisati Perl skriptu koja će ispisati podatke o duljini
# 40 najduljih poruka u datoteci mjereno brojem redaka koje
# poruka zauzima. Svaki redak generiranog ispisa započinje
# brojem retka u kojem poruka započinje (gdje se nalazi niz
# "From nobody"), slijedi dvotočka i potom broj redaka od
# kojih se poruka sastoji.

# Primjer izvršavanja skripte zadatak7.pl:

# $ perl zadatak7.pl 2017-04.mail 
# 15611: 2023
# 46182: 1675
# 21324: 1606
# 33398: 1428
# 18645: 1427
# 53571: 1100
# 6882: 979
# 5903: 978
# 49510: 866
# 13985: 815
# 10310: 739
# 72191: 736
# ...