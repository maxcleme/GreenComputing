use strict;
use warnings;

sub qsort (\@) {_qsort($_[0], 0, $#{$_[0]})}

sub _qsort {
    my ($array, $low, $high) = @_;
    if ($low < $high) {
        my $mid = partition($array, $low, $high);
        _qsort($array, $low,     $mid - 1);
        _qsort($array, $mid + 1, $high   );
    }
}

sub partition {
    my ($array, $low, $high) = @_;
    my $x = $$array[$high];
    my $i = $low - 1;
    for my $j ($low .. $high - 1) {
        if ($$array[$j] <= $x) {
            $i++;
            @$array[$i, $j] = @$array[$j, $i];
        }
    }
    $i++;
    @$array[$i, $high] = @$array[$high, $i];
    return $i;
}



my @array = ();

my $file = '/home/m2iagl/clement/GreenComputing/random';
open my $info, $file or die "Could not open $file: $!";

while( my $line = <$info>)  {
    push(@array, $line);
    last if $. == 1000000;
}
close $info;

qsort @array;
