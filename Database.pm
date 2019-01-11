package Database;
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

sub writePeopleDatabase
{
	my ($class, @list)= @_;
   
    if (@list)
    {
        open(my $filehandler, '>', $s_filename) or die "Could not open the file '$s_filename' $!";
	    foreach my $l_element (@list)
        {
            print $filehandler $l_element->getUnixID, "\t\t\t";
            print $filehandler $l_element->getName, "\t\t\t";
            print $filehandler $l_element->getSurname, "\t\t\t";
            print $filehandler $l_element->getBirthday, "\n";
        }
        close $filehandler;
        return print "Data was written into the database successfully!\n";
    }
    else
    {   print "There is no data in database!\n";
        open(my $filehandler, '>', $s_filename) or die "Could not open the file '$s_filename' $!";
        close $filehandler;
    };

}

sub readPeopleDatabase
{
	my $self = @_;
	my @list;

	open(my $filehandler, '<:encoding(UTF-8)', $s_filename);
	my @l_rawdata = <$filehandler>;
	foreach my $s_line (@l_rawdata)
    {
		chomp $s_line;
		my @ArrayOfLine = split /\t\t\t/, $s_line;
		push @list, my $o_person = People->new(
                                    {
                                        unixID => $ArrayOfLine[0],
                                        name => $ArrayOfLine[1],
                                        surname => $ArrayOfLine[2],
                                        birthday => $ArrayOfLine[3]
                                    });
	}
	close $filehandler;
	return @list;
}

sub searchPeople
{
    my ($self, @list)= @_;
    my $s_key = pop @list;
    my @newlist;

    if (@list)
        {
        foreach my $l_element (@list)
        {
            if ($l_element->getSurname() eq $s_key)
            {
                push @newlist, my $o_person = People->new(
                                    {
                                        unixID => $l_element->getUnixID,
                                        name => $l_element->getName,
                                        surname => $l_element->getSurname,
                                        birthday => $l_element->getBirthday
                                    });
            }
        }
        if (@newlist) 
            { return @newlist; }
        }
    else
        {   print "There is no data in database!\n";	}
}

1;
