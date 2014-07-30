#
# Cookbook Name:: valve_steam
# Recipe:: client
#
# Copyright 2014, Gerald L. Hevener Jr., M.S.
#

# Download Linux Steam client Debian package.
case node['platform_family']
  when "debian"
    # Install 32-bit libs.
    include_recipe 'valve_steam::thirty_two_bit_libs'

    # Install curl.
    include_recipe 'valve_steam::curl'

    # Install xterm.
    include_recipe 'valve_steam::xterm'

    # Install konsole.
    include_recipe 'valve_steam::konsole'

    # Install gnome-terminal.
    include_recipe 'valve_steam::gnome-terminal'

    # Install zenity.
    include_recipe 'valve_steam::zenity'

    # Download Steam Linux client debian Package.
    remote_file "#{Chef::Config[:file_cache_path]}/steam.deb" do
      source node.default['valve_steam']['linux_client_download_url']
      mode '0644'
      action :create_if_missing
    end

    # Install Linux Steam client Debian package.
    execute 'Install Linux Steam client Debian package' do
      command "dpkg -i #{Chef::Config[:file_cache_path]}/steam.deb"
      not_if 'dpkg --get-selections |grep steam'
    end
end
