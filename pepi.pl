#! /usr/bin/perl

BEGIN {
  use Path::Tiny;
  my $s_pepiRootDirectory = path($0)->parent.'/';

  my $s_setupDirectory = $s_pepiRootDirectory . 'setup/';

  use Log::Log4perl;
  Log::Log4perl->init($s_setupDirectory.'log.setup');
}

sub main {

}

main();
