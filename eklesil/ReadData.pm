sub readpeopledatabase()
{
	my %h_people;	
	my $s_filename = 'people.txt';
	open (my $filehandler, '<:encoding(UTF-8)', $s_filename);
		my @l_rawdata = <$filehandler>;
		foreach my $s_line (@l_rawdata)
		{
			chomp $s_line;			
			my @ArrayOfLine = split /\t\t\t/ , $s_line;
			$h_people {"$ArrayOfLine[0]"}= 
			{
				name => $ArrayOfLine[1],
				surname => $ArrayOfLine[2],
				birthday => $ArrayOfLine[3]
			};                
		}
	close $filehandler;
	return %h_people;
}

sub readanimaldatabase()
{
	my %h_animal;	
	my $s_filename = 'animal.txt';
	open (my $filehandler, '<:encoding(UTF-8)', $s_filename);
		my @l_rawdata = <$filehandler>;
		foreach my $s_line (@l_rawdata)
		{
			chomp $s_line;			
			my @ArrayOfLine = split /\t\t\t/ , $s_line;
			$h_animal {"$ArrayOfLine[0]"}= 
			{
				animal => $ArrayOfLine[1],
				group => $ArrayOfLine[2],
				name => $ArrayOfLine[3],
				age => $ArrayOfLine[4]
			};                
		}
	close $filehandler;
	return %h_animal;
}

1;
