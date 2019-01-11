use JSON;

sub writepeopletoJSONfile()
{
	my %h_people = readpeopledatabase();
	
	my $s_json = encode_json \%h_people;

	print "$s_json\n";
	
	open my $filehandler, ">", "people_data.json";
		print $filehandler encode_json($s_json);
	close $filehandler;

	print "People data was saved into people_data.json file.\n";

}

sub writeanimaltoJSONfile()
{
	my %h_animal = readanimaldatabase();
	
	my $s_json = encode_json \%h_animal;

	print "$s_json\n";
	
	open my $filehandler, ">", "animal_data.json";
		print $filehandler encode_json($s_json);
	close $filehandler;

	print "Animal data was saved into animal_data.json file.\n";

}

1;


=begin comment AN EXAMPLE FOR JSON FILE READ AND WRITE
use JSON;

sub read_from_file {
my $json;
{
  local $/; #Enable 'slurp' mode
  open my $fh, "<", "data_in.json";
  $json = <$fh>;
  close $fh;
}
return decode_json($json);
}

sub write_to_file {
my $data  = shift;
open my $fh, ">", "data_out.json";
print $fh encode_json($data);
close $fh;
}

=cut
