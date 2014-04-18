#!/usr/bin/env perl
# A simple script to search for system administrator jobs.
# Just change the searches and cities arrays.

use strict;
my @cities = qw{austin sfbay losangeles newyork sandiego boston chicago seattle portland};
my @searches = qw{bash perl ruby python php puppet chef kvm xen hyper-v vmware aws openstack rackspace};

for my $city (@cities) {
	print "$city  \n";
	for my $keyword (@searches) {
		my $url = "http://$city.craigslist.org/search/sad?query=$keyword";
		my $html = qx{ curl --silent -L '$url' };
		my @matches = $html =~ /1 - (\d+)/;
		my $count = $matches[0];
		print "$keyword: $count ";
	}
	print "\n";
}
