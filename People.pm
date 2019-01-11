package People;
use Data::Dumper;
use strict;
use warnings;


sub new{
    my ($class,$args) = @_;
    my $self = bless { 
                    unixID => $args->{unixID},
                    name => $args->{name},
                    surname => $args->{surname},
                    birthday => $args->{birthday}
                     }, $class;
    return $self;
}

sub getUnixID{
   my $self = shift;
   return $self->{unixID};
}

sub getName{
   my $self = shift;
   return $self->{name};
}

sub getSurname{
   my $self = shift;
   return $self->{surname};
}

sub getBirthday{
   my $self = shift;
   return $self->{birthday};
}

sub setUnixID{
   my ($self,$new_unixid) = @_;
   $self->{name} = $new_unixid;
}

sub setName{
   my ($self,$new_name) = @_;
   $self->{name} = $new_name;
}

sub setSurname{
   my ($self,$new_surname) = @_;
   $self->{surname} = $new_surname;
}

sub setBirthday{
   my ($self,$new_birthday) = @_;
   $self->{birthday} = $new_birthday;
}

1;