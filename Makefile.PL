
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "draw graph as a DSM matrix",
  "AUTHOR" => "Joenio Costa <joenio\@colivre.coop.br>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Graph-Writer-DSM",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Graph::Writer::DSM",
  "PREREQ_PM" => {
    "Chart::Gnuplot" => 0,
    "File::Temp" => 0,
    "Graph::Writer" => 0,
    "List::MoreUtils" => 0,
    "Modern::Perl" => 0,
    "Mojo::Template" => 0,
    "base" => 0
  },
  "TEST_REQUIRES" => {
    "File::Path" => 0,
    "Graph" => 0,
    "Module::Install::Can" => 0,
    "Test::Class" => 0,
    "Test::File" => 0,
    "Test::Most" => 0,
    "Test::TempDir" => 0
  },
  "VERSION" => "0.006",
  "test" => {
    "TESTS" => "t/Graph/Writer/*.t t/Graph/Writer/DSM/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  my $tr = delete $WriteMakefileArgs{TEST_REQUIRES};
  my $br = $WriteMakefileArgs{BUILD_REQUIRES};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

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



