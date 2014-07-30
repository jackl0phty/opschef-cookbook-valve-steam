#
# Cookbook Name:: valve_steam
# Recipe:: wine_dev_release
#
# Copyright 2014, Gerald L. Hevener Jr., M.S.
#

# Install 32-bit libs.
include_recipe 'valve_steam::thirty_two_bit_libs'

# Make sure we have bzip2.
include_recipe 'valve_steam::bzip2'

# Install development release of wine.
remote_file "#{Chef::Config[:file_cache_path]}/wine-#{node['valve_steam']['wine_dev_release_version']}.tar.bz2" do
  source node['valve_steam']['wine_dev_release_url']
  not_if "test -f #{Chef::Config[:file_cache_path]}/wine-#{node['valve_steam']['wine_dev_release_version']}.tar.bz2"
end

# Check system arch.
case node['target_cpu']

  when 'x86_64'

    bash "Execute configure script" do
      user "root"
      cwd node['valve_steam']['chef_cache_dir']
      code <<-EOH
      bunzip2 wine-#{node['valve_steam']['wine_dev_release_version']}.tar.bz2
      tar wine-#{node['valve_steam']['wine_dev_release_version']}.tar
      cd wine-#{node['valve_steam']['wine_dev_release_version']}
      ./configure --enable-win64
      EOH
    end
end

def install_wine()

   # Use Ark cookbook install wine development release via source.
  ark "wine" do
    url node['valve_steam']['wine_dev_release_url']
    version node['valve_steam']['wine_dev_release_version']
    extension "tar.bz2"
    owner "root"
    checksum node['valve_steam']['wine_dev_release_checksum']
    action [ :configure, :install_with_make ]
  #  not_if { File.exists?("/usr/local/include/eventlog") }
  end

end
