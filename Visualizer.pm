package Visualizer;
use Data::Dumper;
use strict;
use warnings;

my $s_filename = 'people.txt';

sub new
{
	my $class = shift;
	my $self = {};
	bless $self, $class;
	return $self;
}


sub printPeopleDatabase
{
	my ($class, @list) = @_;

	print "-" x 48, "PEOPLE IN DATABASE", "-" x 48, "\n";
	print "Unix timestamp\t\t\t", "Name\t\t\t", "Surname\t\t\t", "Birthday", "\n";
	print "-" x 114, "\n";

	if (@list)
    {
		foreach my $l_element (@list)
        {
			print $l_element->getUnixID(),"\t\t\t";
			print $l_element->getName(),"\t\t\t";
			print $l_element->getSurname(), "\t\t\t";
			print $l_element->getBirthday(), "\n";
		}
		print "-------PRINT COMPLETED-------\n\n";
	}
    else
    {       print "There is no data in database!\n";	}
}


1;
