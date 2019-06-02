use strict; 
use warnings;

sub main {
    my $cnt = 0;
    my $re = qr/((?<=^.{1})|(?<=\t.{1}))bc((?=.{3}+\t)|(?=.{3}+$))/;
    while (<>) {
        tr/A-Z/a-z/;
        s/$re/++$cnt/eg;
    }
    print "$cnt\n";
}
main();