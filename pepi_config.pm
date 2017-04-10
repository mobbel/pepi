package pepi_config;

sub loadConfiguration {
  my ($pepi) = @_;
  $pepi->setConfiguration({
    htmlDev => {
      files         => {
        cwd         => 'sourceDir',
        src         => ['**/*.tt', '**/*.html'],
        destination => 'destinationDir', #otional
        ext         => 'tt', #optional
      },
    },
    htmlmin => {
      options => {
        remove_comments => false,
        remove_newlines => false,
        do_javascript => false,
        do_stylesheet => false,
        no_compress_comment => false,
        html5 => false,
      }
    },
  });

  $pepi->registerTasks('html',[
    'htmlmin',
  ]);

  $pepi->registerChains('htmlDev',[
    'html'
  ]);
}

return 1;
