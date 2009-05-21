# -*- perl -*-

BEGIN { require 5.008008; }

use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    ABSTRACT_FROM => 'lib/MojoX/Renderer/JSON.pm',
    VERSION_FROM  => 'lib/MojoX/Renderer/JSON.pm',
    AUTHOR        => q[Graham Barr <gbarr@cpan.org>],
    NAME          => q[MojoX::Renderer::JSON],
    PREREQ_PM     => {
        'Test::More' => 0,
        'JSON'       => '2.10',
    },
    (eval { ExtUtils::MakeMaker->VERSION(6.31) } ? (LICENSE => 'perl') : ()),
    (   eval { ExtUtils::MakeMaker->VERSION(6.46) } ? (
            META_MERGE => {
                resources => {    ##
                    repository => 'http://git.goingon.net/?p=MojoX-Renderer-JSON.git',
                },
            }
          )
        : ()
    ),
);

