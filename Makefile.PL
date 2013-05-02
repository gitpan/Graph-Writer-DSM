
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "draw graph as a DSM matrix",
  "AUTHOR" => "Joenio Costa <joenio\@colivre.coop.br>",
  "BUILD_REQUIRES" => {
    "Graph" => 0,
    "Test::File" => 0,
    "Test::Most" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Graph-Writer-DSM",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Graph::Writer::DSM",
  "PREREQ_PM" => {
    "Chart::Gnuplot" => 0,
    "File::Path" => 0,
    "File::Temp" => 0,
    "Graph::Writer" => 0,
    "List::MoreUtils" => 0,
    "Modern::Perl" => 0,
    "Test::Class" => 0,
    "Test::TempDir" => 0,
    "base" => 0
  },
  "VERSION" => "0.001",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



