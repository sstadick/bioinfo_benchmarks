use v5.26;
use warnings;
use List::Util qw(sum);

package Record {
    use Class::XSAccessor
      constructor => 'new',
      accessors   => ['name', 'count'];
}

sub create_records {
    my $count = scalar(grep { index(lc substr($_, 1, 5), 'bc') >= 0 } @_);
    return Record->new(
        name  => $_[0],
        count => $count
    );
}

sub main {
    my @records;
    while (my $line = <STDIN>) {
        push @records, create_records(split(/\t/, $line));
    }
    say sum(map { $_->count } @records);
}

main();