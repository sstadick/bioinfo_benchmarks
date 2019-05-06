use strict; 
use warnings;

sub main {
    my $cnt = 0;
    while (<>) {
    for my $x (split(/\t/)) {
        ++$cnt if index(lc(substr($x, 1, 3)), "bc") >= 0;
    }
    }
    print "$cnt\n";
}
main()