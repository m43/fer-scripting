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





my $x = 6 + 7 . "Z";
print $x;
say "-" x 30;


my $y = "ae " gt "ae";
print $y;
say "-" x 30;


my @z = (1,2,3);
$z[9] = 10;

print "\$_ before: $_\n";
while ($_ = shift(@z)){
# while ($_ = pop(@z)){
# for (@z) {
    print 0+$_;
    print "\n";
}
print "\$_ after: $_\n";
say "-" x 30;


my @fred = qw(hello dolly);
$y = 2;
print "This is $fred[1]'s place\n";
print "This is $fred[$y-1]'s place\n";
$y = "2*4";
print "This is $fred[$y-1]'s place\n";  # whoopsy doops
say "-" x 30;


my @numbers = 0..20;
print "before sort @numbers\n";
@numbers = sort @numbers;
print "after sort @numbers\n";

@numbers = 6..10;
print "before reverse @numbers\n";
@numbers = reverse @numbers;
print "after reverse @numbers\n";
say "-" x 30;

my @betty = ();
push @betty, "prvi";
say @betty;
say "-" x 30;

my $filename = ">/etc/passwd";
my $success = open FILE, "$filename";
if (! $success) {
    say "Could not open '$filename': $!"
}
say "-" x 30;

my $a = "a b d a s";
$_=$a;
my @x = split;
print "@x";
# my $i = 0;
# for $i in @x {
#     say $i;
# }
print @x x @x;
say "-" x 30;
