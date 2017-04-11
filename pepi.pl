#! /usr/bin/perl

use strict;
use warnings;

BEGIN {
  use Path::Tiny;
  my $s_prj = path(__FILE__)->absolute->parent->parent.'/';

  my $s_pepiRootDirectory = $s_prj.'pepi/';
  my $s_setupDirectory = $s_pepiRootDirectory . 'setup/';

  use Log::Log4perl;
  Log::Log4perl->init($s_setupDirectory.'log.setup');

  unshift @INC, $s_pepiRootDirectory;
}

sub main {
  require classes::class_pepi;
  require pepi_config;

  my $or_pepi = new classes::class_pepi({});

  pepi_config::loadConfiguration($or_pepi);

  my $s_chain = checkForArgs(\@ARGV);

  $or_pepi->loadChain($s_chain);
}

sub checkForArgs {
  my ($ar_args) = @_;

  foreach my $s_arg (@{$ar_args}) {
    if($s_arg eq '--help') {
      printHelp();
      last;
    }
    else {
      return $s_arg;
      last;
    }
  }

}

sub printHelp {
  use feature "say";
  say '########################################################';
  say '#                   Perl Pipe Runner                   #';
  say '#                                                      #';
  say '# --help - this help                                   #';
  say '#                                                      #';
  say '# usage:                                               #';
  say '#                                                      #';
  say '# ./pepi.pl <chain>                                    #';
  say '#                                                      #';
  say '########################################################';
}

sub printVersion {
  use feature "say";
  say 'Version 0.0.1'
}

main();
