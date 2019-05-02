use strict;
use warnings;
use List::Util qw(sum);

sub create_records {
    my @vals = @_;
    my $count = scalar(grep {substr($_, 1, 5) =~ /bc/i} @vals);
    return {
        "name" => $vals[0],
        "count" => $count
    };
}

sub main {
    my @records;
    while(my $line = <STDIN>) {
       push @records, create_records(split(/\t/, $line));
    }
    print sum(map {$_->{count}} @records) . "\n";
}
main();