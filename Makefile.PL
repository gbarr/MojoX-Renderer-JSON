# -*- perl -*-

use inc::Module::Install;

perl_version    5.008008;

module_name     'MojoX::Renderer::JSON';
all_from        'lib/MojoX/Renderer/JSON.pm';

resources  repository  => 'http://git.goingon.net/?p=MojoX-Renderer-JSON.git';

requires        'JSON' => 2.10;

auto_install;

WriteAll(
  sign => 1
);



