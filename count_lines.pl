use strict;
use warnings;

my $count = 0;
while (my $length = <STDIN>) {
    my @vals = split(/\t/, $length);
    $count += scalar(@vals);
}
print $count . "\n";