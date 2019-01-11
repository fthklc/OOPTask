use warnings;
use strict;
use Data::Dumper;

sub ltrim { my $s = shift; $s =~ s/^\s+//;       return $s };
sub rtrim { my $s = shift; $s =~ s/\s+$//;       return $s };
sub  trim { my $s = shift; $s =~ s/^\s+|\s+$//g; return $s };

my $test = 'RWEsesetT';

$test = lc $test;
print $test;


my $test2 = '
test2';

print $test2, "\n";

my $test3 = '      test3        ';

my $test4 = 'ayri mi?';
my $test5 = '           test5';

print $test3, $test4, "\n";

print $test5, $test4, "\n";

print trim($test5), $test4, "\n";

print $test, trim($test2);
