use strict;
use warnings;

package classes::class_pepi;

sub new {
  my ($or_self, $hr_variables) = @_;

  $hr_variables->{config} = {};

  bless $hr_variables, $or_self;
}

sub setConfiguration {
  my ($or_self, $configuration) = @_;

  $or_self->{config} = $configuration;
}

sub readFiles {

}

sub writeFiles {

}

return 1;
