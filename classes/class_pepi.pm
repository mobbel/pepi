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
  my ($or_self, $or_filesConfiguration) = @_;
  my $s_path = $or_filesConfiguration->{cwd};

  use Data::Dumper;
  warn '##################### SS - Start #####################';
  warn Data::Dumper::Dumper($s_path);
  warn '###################### SS - End ######################';

  opendir(DIR, $s_path) or die "Unable to open $s_path: $!";
  my @files =
    map { $s_path . '/' . $_ }
    grep { !/^\.{1,2}$/ }
    readdir (DIR);

    return
      grep { (/\.html$/) &&
             (! -l $_) }
      map { -d $_ ? $or_self->readFiles($_) : $_ }
      @files;
}

sub readFileContent {
  my ($or_self, $s_file) = @_;

  open(FH, $s_file);
  return join('', <FH>);
}

sub writeFileContent {

}

sub registerTask {
  my ($or_self, $taskGroup, $tasks) = @_;
  $or_self->{tasks}->{$taskGroup} = $tasks;
}

sub registerChain {
  my ($or_self, $chainName, $taskGroups) = @_;
  $or_self->{chains}->{$chainName} = $taskGroups;
}

sub loadChain {
  my ($or_self, $s_chain)   = @_;
  my $ar_taskGroups         = $or_self->{chains}->{$s_chain};
  my $or_chainConfiguration = $or_self->{config}->{$s_chain};

  my @a_fileList = $or_self->readFiles($or_chainConfiguration->{files});

  foreach my $file (@a_fileList) {
    my $s_fileContent = $or_self->readFileContent($file);

    use Data::Dumper;
    warn '##################### SS - Start #####################';
    warn Data::Dumper::Dumper($s_fileContent);
    warn '###################### SS - End ######################';
  }
}

1;
