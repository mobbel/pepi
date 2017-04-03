package classes::class_pepi;

sub new {
  my ($or_self, $hr_variables) = @_;

  bless $hr_variables, $or_self;
}

return 1;
