use strict;
use warnings;
use List::Util qw(sum);

BEGIN {
    package Record;
    use Moo;
    has name => (is => 'rw');
    has count => ( is => 'rw');

    $INC{"Record.pm"};
}

use Record;

sub create_records {
    my $count = scalar(grep {index(lc substr($_, 1, 5), 'bc') >= 0} @_);
    # return {
    #     "name" => $_[0],
    #     "count" => $count
    # };
    return new Record->new(
        name => $_[0],
        count => $count
    );
}

sub main {
    my @records;
    while(my $line = <STDIN>) {
       push @records, create_records(split(/\t/, $line));
    }
    print sum(map {$_->{count}} @records) . "\n";
}
main();