#!/usr/bin/perl -w

use strict;
use warnings;
use POSIX;
use Data::Dumper;
use lib "/home/fatihkilic/workspace/taskOOP/taskOOP_v6";
use People;
use Database;
use Visualizer;
no lib "/home/fatihkilic/workspace/taskOOP/taskOOP_v6"; 

sub RunPeopleDataController
{
	while (1)
	{	
		print "Menu\n";
		print "1 - Show People!\n";
		print "2 - Add a person!\n";
		print "3 - Search for a person, use last name!\n";
		print "4 - Delete or Update a person's data!\n";
		print "5 - Save data as a JSON file!\n";
		print "Type the number OR Press Enter to QUIT: ";
		my $i_entry = <STDIN>;
		chomp $i_entry;
		$i_entry = trim_function($i_entry);
		print "\n";

		unless ($i_entry =~ /^(1|2|3|4|5||)$/)
			{print "Wrong Entry! Please enter a number from Menu or Press Enter to exit!\n";}
		
		last if ($i_entry eq "");

####----SHOW PEOPLE IN DATABASE----####		
		do			
		{
			my $o_database = Database->new();
			my $o_visualizer = Visualizer->new();
			$o_visualizer->printPeopleDatabase($o_database->readPeopleDatabase());
		} if ($i_entry == 1);

####----ADD A PERSON INTO DATABASE----####
		do			
		{ 
				my $i_unixID = mktime (localtime()); 
				print ("Name: ");
				my $s_name = <STDIN>;
				chomp $s_name;
				$s_name = trim_function($s_name);
				$s_name = uc $s_name;
				
				print "Surname:";
				my $s_surname = <STDIN>;
				chomp $s_surname;
				$s_surname = trim_function($s_surname);
				$s_surname = uc $s_surname;

				print "Birthday(DD/MM/YY): ";  
				my $s_birthday = <STDIN>;
				chomp $s_birthday;
				$s_birthday = trim_function($s_birthday);

				my $o_database = Database->new();
				my @l_people = $o_database->readPeopleDatabase();
				my $o_person = People->new(
					{ 
						unixID => $i_unixID,
						name => $s_name,
                    	surname => $s_surname,
                        birthday => $s_birthday
					});		
				my @newdatabase = (@l_people, $o_person);
				$o_database->writePeopleDatabase(@newdatabase);

		} if ($i_entry == 2);					

####----SEARCH FOR A PERSON IN DATABASE----####
		do			
		{ 
				my $o_database = Database->new();
				my $o_visualizer = Visualizer->new();
				my @l_people = $o_database->readPeopleDatabase();

				print "Please enter the Surname of the user to search in Database\n";
				print ("Surname: ");
				my $s_searchkey = <STDIN>;
				chomp $s_searchkey;
				$s_searchkey = trim_function($s_searchkey);
				$s_searchkey = uc $s_searchkey;

				my @newdatabase = (@l_people, $s_searchkey);
				$o_database->searchPeople(@newdatabase);
				
				if ($o_database->searchPeople(@newdatabase)) 
            		{$o_visualizer->printPeopleDatabase($o_database->searchPeople(@newdatabase));}
				else
					{print "There is no data to print!\n";}		

		} if ($i_entry == 3);			

####----DELETE OR UPDATE PERSON DATA----####
		do			
		{ 
			print "- Do you want to delete a person's data from database?\n";
			print "- Do you want to update a person's data?\n";
			print "Type 'delete' or 'update' or Press Enter to QUIT: ";
			my $s_entry = <STDIN>;
			chomp $s_entry; 
			$s_entry = lc $s_entry;
			$s_entry = trim_function($s_entry);

			unless ($s_entry =~ /^(update|delete||)$/)
				{print "Wrong Entry! Please write 'delete' or 'update' or Press Enter to exit!\n";}	

			if ($s_entry eq "")
       				{die;}
			else 
			{
				if ($s_entry eq "update")
					{
						my $o_database = Database->new();
						my $o_visualizer = Visualizer->new();
						my @l_people = $o_database->readPeopleDatabase();
						
						print "Please enter the Unix timestamp of the user\n";
						print ("Unix timestamp: ");
						my $s_unixID = <STDIN>;
						chomp $s_unixID;
						$s_unixID = trim_function($s_unixID);

						foreach my $l_element (@l_people)
						{
							if ($l_element->getUnixID() eq $s_unixID)
							{                    
								print "Please enter name: ";
								my $s_name = <STDIN>;
								chomp $s_name;
								$s_name = trim_function($s_name);
								$s_name = uc $s_name;

								print "Please enter surname: ";
								my $s_surname = <STDIN>;
								chomp $s_surname;
								$s_surname = trim_function($s_surname);
								$s_surname = uc $s_surname;

								print "Please enter birthday in DD/MM/YYYY format: ";
								my $s_birthday = <STDIN>;
								chomp $s_birthday;
								$s_birthday = trim_function($s_birthday);

								$l_element->setName($s_name);
								$l_element->setSurname($s_surname);
								$l_element->setBirthday($s_birthday);            
								print "The person with ", $l_element->getUnixID(), " unix timestamp ", $l_element->getName(), " ", $l_element->getSurname(), " data was updated!\n";
								$o_visualizer->printPeopleDatabase($l_element);
							}
						}
						$o_database->writePeopleDatabase(@l_people);					
					}		
				else 
					{
						if ($s_entry eq "delete")
						{
							my $o_database = Database->new();
							my $o_visualizer = Visualizer->new();
							my @l_people = $o_database->readPeopleDatabase();
							
							print "Please enter the Unix timestamp of the user\n";
							print ("Unix timestamp: ");
							my $s_unixID = <STDIN>;
							chomp $s_unixID;
							#$s_unixID = trim_function($s_unixID);
							my $i_counter = 0;

							foreach my $l_element (@l_people)
							{
								if ($l_element->getUnixID() eq $s_unixID)
								{
									splice @l_people, $i_counter, 1;
								}
								$i_counter = $i_counter + 1;
							}
							print "Person was deleted from the database!\n";
							$o_visualizer->printPeopleDatabase(@l_people);
							$o_database->writePeopleDatabase(@l_people);				
						}
					}
			}
		} if ($i_entry == 4);
	#buraya devam
	}
}

sub  trim_function 
{ 
	my $s_entry = shift; 
	$s_entry =~ s/^\s+|\s+$//g; 
	return $s_entry 
}

1;
=begin

		do { writepeopletoJSONfile(); } if ($i_entry == 5);		#WriteToJSON.pm
 


sub RunAnimalDataController
{

}

1;

=begin 
sub RunAnimalDataController
{
	while (1)
		{
			print "Menu\n";
			print "1 - Show Animals!\n";
			print "2 - Add an animal!\n";
			print "3 - Search for an animal!\n";
			print "4 - Delete or Update an animal's data!\n";
			print "5 - Save animal data as a JSON file!\n";
			print "Type the number OR Press Enter to QUIT: ";
			my $i_entry = <STDIN>;
			chomp $i_entry;
			print "\n";
			
			last if ($i_entry eq "");

			do { showanimaldatabase(); } if ($i_entry == 1);

			
			do { addanimal(); } if ($i_entry == 2);


			do { searchanimal(); } if ($i_entry == 3);
	
			do 
			{ 
				print "- Do you want to delete an animal from database?\n";
				print "- Do you want to update an animal's data?\n";
				print "Type 'delete' or 'update' or Press Enter to QUIT: ";
				my $s_entry = <STDIN>;
				chomp $s_entry; 
				if ($s_entry eq "")
						{die;}
				else 
				{
					if ($s_entry eq "update")
						{ updateanimaldata(); }
					else 
						{
						if ($s_entry eq "delete")
								{ deleteanimaldata(); }
						}
				}
			} if ($i_entry == 4);


			do { writeanimaltoJSONfile(); } if ($i_entry == 5);

		}
}
=cut 

=cut

