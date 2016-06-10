#!/usr/bin/perl -w

use strict;

chomp(my @lines = <>);
my $curr_line = 0;
while ($curr_line <= $#lines){
	if ($lines[$curr_line] =~ />\w+\|\w+\|\w+\|(\w+)\|\w+\|\w+\|([^\|]+)\|/){
		my $marker_name = $1;
		my $variation = $2;
		$curr_line++;
		my $sequence_str = '';
		until ($curr_line > $#lines || $lines[$curr_line] =~ />/){
			$sequence_str = $sequence_str . $lines[$curr_line];
			$curr_line++;
		}
		$sequence_str =~ s/_/[$variation]/;
		print $marker_name . "\t" . $sequence_str . "\n";
	}
}
