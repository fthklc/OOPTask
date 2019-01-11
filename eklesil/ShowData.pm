sub showpeopledatabase()
{        
   	my %h_people = readpeopledatabase();		#ReadData.pm
	
	my @l_people = %h_people;

	printpeoplehashdata(@l_people);				#PrintData.pm
}

sub showanimaldatabase()
{
	my %h_animal = readanimaldatabase();

	my @l_animal = %h_animal;

	printanimalhashdata(@l_animal);

}

1;

