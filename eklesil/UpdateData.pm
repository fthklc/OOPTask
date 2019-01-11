sub updatepersondata()
{
	my %h_people = readpeopledatabase();		#ReadData.pm

	print "Please enter the Unix timestamp of the user\n";
	print ("Unix timestamp: ");
	my $s_unixID = <STDIN>;
	chomp $s_unixID;

	foreach my $s_key (keys %h_people)
	{
		if ($s_unixID eq $s_key)
                {                    
			print "Please enter name:";
			$s_name = <STDIN>;
			chomp $s_name;

			print "Please enter surname:";
			$s_surname = <STDIN>;
			chomp $s_surname;

			print "Please enter birthday:";
			$s_birthday = <STDIN>;
			chomp $s_birthday;

			$h_people{$s_unixID}{name} = $s_name;
			$h_people{$s_unixID}{surname} = $s_surname;
			$h_people{$s_unixID}{birthday} = $s_birthday;            
			print "The person with $s_unixID unix timestamp, $s_name $s_surname data was updated!\n";
                }
	}
	my @l_people = %h_people;
	writepeopledatabase(@l_people);		#WriteData.pm
}

sub updateanimaldata()
{
	my %h_animal = readanimaldatabase();		#ReadData.pm

	print "Please enter the Unix timestamp of the animal\n";
	print ("Unix timestamp: ");
	my $s_unixID = <STDIN>;
	chomp $s_unixID;

	foreach my $s_key (keys %h_animal)
	{
		if ($s_unixID eq $s_key)
                {                    
        
					print ("Please enter Animal: ");
					my $s_animal = <STDIN>;
					chomp $s_animal;
					
					print "Please enter its Group:";
					my $s_group = <STDIN>;
					chomp $s_group;

					print "Please enter Name: ";  
					my $s_name = <STDIN>;
					chomp $s_name;

					print "Please enter Age: ";  
					my $s_age = <STDIN>;
					chomp $s_age;

					$h_animal{$s_unixID}{animal} = $s_animal;
					$h_animal{$s_unixID}{group} = $s_group;
					$h_animal{$s_unixID}{name} = $s_name;
					$h_animal{$s_unixID}{age} = $s_age;            
					print "The animal data with $s_unixID unix timestamp, $s_name data was updated!\n";
                }
	}
	my @l_animal = %h_animal;
	writeanimaldatabase(@l_animal);		#WriteData.pm

}

1;
