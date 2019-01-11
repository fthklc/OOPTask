sub searchpeople()
{
	my %h_people = readpeopledatabase();        #ReadData.pm
	my %h_search;
	my @l_search;

        print "Please enter the Surname of the user to search in Database\n";
        print ("Surname: ");
        $s_searchkey = <STDIN>;
        chomp $s_searchkey;

        foreach $s_key (keys %h_people)
        {
            if ($s_searchkey eq $h_people{$s_key}{surname})
            {
                $h_search{$s_key}{name} = $h_people{$s_key}{name};
                $h_search{$s_key}{surname} = $h_people{$s_key}{surname};
                $h_search{$s_key}{birthday} = $h_people{$s_key}{birthday};
            }
        }

	@l_search = %h_search;

	printpeoplehashdata(@l_search);	        #PrintData.pm
}

sub searchanimal()
{
	my %h_animal = readanimaldatabase();        #ReadData.pm
	my %h_search;
	my @l_search;

        print "Please enter the name of animal to search in Database\n";
        print ("Name: ");
        $s_searchkey = <STDIN>;
        chomp $s_searchkey;

        foreach $s_key (keys %h_animal)
        {
            if ($s_searchkey eq $h_animal{$s_key}{name})
            {
                $h_search{$s_key}{animal} = $h_animal{$s_key}{animal};
                $h_search{$s_key}{group} = $h_animal{$s_key}{group};
                $h_search{$s_key}{name} = $h_animal{$s_key}{name};
                $h_search{$s_key}{age} = $h_animal{$s_key}{age};
            }
        }

	@l_search = %h_search;

	printanimalhashdata(@l_search);	        #PrintData.pm
}

1;

