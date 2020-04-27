#!/usr/bin/perl -w

use strict;
use warnings;
use diagnostics;

use feature 'say';
use feature 'switch';

use v5.30;

my %month2number = qw(
    jan 01  feb 02  mar 03
    apr 04  may 05  jun 06
    jul 07  aug 08  sep 09
    oct 10 nov 11 dec 12
);

sub process_log_file_lines {
    my @lines = @_;

    my $date;
    my @keys = 0..23;
    my %count;
    map { $count{$_} = 0 } @keys;
    for my $info (@lines){
        chomp $info;
        if (!$date) {
            ($date) = $info =~ m!.*\[(\d\d/\w\w\w/\d\d\d\d)!;
            my @date_parts = split "/", lc($date);
            $date = "$date_parts[2]-$month2number{$date_parts[1]}-$date_parts[0]";
        }
        my($hour) =  $info =~ /[^:]+:(\d\d):/;
        if(length $hour) {
            $hour = $hour + 0;  # love this line <3 m43
            if( grep { $hour eq $_ } @keys ){
                $count{$hour} = $count{$hour} + 1;
            } else {
                print "Hula Palu --->$hour<---\n";
            }
        }
    }

    print " Datum: $date\n";
    print " sat : broj pristupa\n";
    print "-" x 31 . "\n";
    for (@keys) {
        printf " %02d : %d\n", $_, $count{$_};
    }
    print "\n\n";
}

if($#ARGV == -1) {
    my @lines = <>;
    process_log_file_lines(@lines);
} else {
    print "Got ", $#ARGV+1," files. They are the following:\n";
    for(@ARGV) {
        print "$_\n";
    }
    print "\n\n";

    for(@ARGV) {
        open my $fh, '<', $_ or die "Can't open file : $!";
        my @lines = <$fh>;
        process_log_file_lines(@lines);
        close $fh or die "Couldn't Close File : $!";
    }
}

#  Datum: 2008-02-24
#  sat : broj pristupa
# -------------------------------
#  00 : 99
#  01 : 62
#  02 : 15
#  ...
#  21 : 599
#  22 : 615
#  23 : 593
