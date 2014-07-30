name             'valve_steam'
maintainer       'Gerald L. Hevener Jr., M.S.'
maintainer_email 'jackl0phty@gmail.com'
license          'Apache 2.0'
description      'Installs/Configures valve_steam'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.2'

# Cookbook dependencies.
%w{ ark }.each do |cb|
  depends cb
end
