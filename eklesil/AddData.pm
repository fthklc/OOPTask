sub addperson()
{
	my %h_people = readpeopledatabase();        #ReadData.pm

	my $i_unixID = mktime (localtime());
        
        print ("Name: ");
        my $s_name = <STDIN>;
        chomp $s_name;
        
        print "Surname:";
        my $s_surname = <STDIN>;
        chomp $s_surname;

        print "Birthday(DD/MM/YY): ";  
        my $s_birthday = <STDIN>;
        chomp $s_birthday;

        $h_people {"$i_unixID"}= 
        {
            name => $s_name,
            surname => $s_surname,
            birthday => $s_birthday
        };
	
	my @l_people = %h_people;
	writepeopledatabase(@l_people);     #WriteData.pm
}

sub addanimal()
{
	my %h_animal = readanimaldatabase();        #ReadData.pm

	my $i_unixID = mktime (localtime());
        
        print ("Animal: ");
        my $s_animal = <STDIN>;
        chomp $s_animal;
        
        print "Group:";
        my $s_group = <STDIN>;
        chomp $s_group;

        print "Name: ";  
        my $s_name = <STDIN>;
        chomp $s_name;

        print "Age: ";  
        my $s_age = <STDIN>;
        chomp $s_age;

        $h_animal {"$i_unixID"}= 
        {
            animal => $s_animal,
            group => $s_group,
            name => $s_name,
            age => $s_age
        };
	
	my @l_animal = %h_animal;
	writeanimaldatabase(@l_animal);     #WriteData.pm


}

1;

