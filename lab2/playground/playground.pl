#!/usr/bin/perl -w

use strict;
use warnings;
use diagnostics;

use feature 'say';
use feature "switch";

use v5.30;

# u '' se samo \\ i \' se interpretiraju, ostalo ne
say '\\\nsay\n\'\t\r';

### kod "":
# \n novi red
# \t tabulator
# \007 oktalna ASCII vrijednost
# \x7f heksadekadska ASCII vrijednost
# \l sljedeći znak prebaci u malo slovo
# \L prebaci u mala slova sve znakove do \E
# \u sljedeći znak prebaci u veliko slovo
# \U prebaci u velika slova sve znakove do \E
# \E završetak slijeda nakon \L i \U
print "Hello " x 2.9 . "world!\n"; # 2.9 se reducira na 2

say "      12" * " 3";
say "-" x 30;

my @x = (1,2,3);
$x[0] = 100;
$x[-1] = 300;
#say $x[10];  # would give warning
say $#x;  # 2 is the index of the last elemet..
say "-" x 30;

foreach my $item (@x){
    say "X::$item";
}
say "-" x 30;

for (@x){
    say "X::$_";
}
say "-" x 30;



my @ferdo = qw(eating rocks is wrong);
my $ferdo = "right";
print "this is $ferdo[3]\n";
print "this is ${ferdo}[3]\n";
print "this is $ferdo"."[3]\n";
print "this is $ferdo\[3]\n";
say "-" x 30;

$_ = "yabba dabba doo\n";
print;

## Diferent contexts exist
    # $fred = something; # scalar context
    # @pebbles = something; # list context
    # ($wilma, $betty) = something; # list context
    # ($dino) = something; # still list context!
## all scalar:
    # $fred[3] = something;
    # 123 + something
    # something + 654
    # if (something) { ... }
    # while (something) { ... }
    # $fred[something] = something;
## all list
    # push @fred, something;
    # foreach $fred (something) { ... }
    # sort something
    # reverse something
    # print something
my @backwards = reverse qw ! yabba dabba doo !; # list in list context (all good)
my $backwards = reverse qw ! yabba dabba doo !; # list in SCALAR context (oodabbadabbay)
print "@backwards\n";
print "$backwards\n";
say "-" x 30;

my @rocks = qw( talc quartz jade obsidian );
print "How many rocks do you have?\n";
print "I have ", @rocks, " rocks.\n"; # ispisuje listu a ne broj
print "I have ", scalar @rocks, " rocks.\n"; # daje broj
say "-" x 30;

sub pikant {
    my $x = @_;  # list context
    my ($y) = @_;  # scalar context
    print $x, "<--->", $y, "\n";
}

&pikant(1,2,3);
&pikant 1 2 3;  # i can do this because pikant is already defined ^ 
pikant 1 2 3;  # furthermore, this can be done because there is no builtin function of same name
say "-" x 30;
