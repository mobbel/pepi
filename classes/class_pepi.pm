use strict;
use warnings;

package classes::class_pepi;

sub new {
  my ($or_self, $hr_variables) = @_;

  $hr_variables->{config} = {};
  $hr_variables->{tasks} = {};
  $hr_variables->{chains} = {};

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

sub registerTasks {
  my ($or_self, $taskGroup, $tasks) = @_;
  $or_self->{tasks}->{$taskGroup} = $tasks;
}

sub registerChains {
  my ($or_self, $chainName, $taskGroups) = @_;
  $or_self->{chains}->{$chainName} = $taskGroups;
}

1;
