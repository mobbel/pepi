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
  my $or_pepi = new classes::class_pepi({});

  $or_pepi->setConfiguration('test')
}

main();
