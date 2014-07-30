#
# Cookbook Name:: valve_steam
# Recipe:: default
#
# Copyright 2012, Gerald L. Hevener Jr., M.S.
#

# Wine development release version.
node.default['valve_steam']['wine_dev_release_version'] = '1.7.4'

# Wine development release download URL.
node.default['valve_steam']['wine_dev_release_url'] = "http://prdownloads.sourceforge.net/wine/wine-#{node['valve_steam']['wine_dev_release_version']}.tar.bz2"

# Default Chef cache directory.
node.default['valve_steam']['chef_cache_dir'] = '/var/chef/cache'

# Linux Steam client download URL.
node.default['valve_steam']['linux_client_download_url'] = 'http://media.steampowered.com/client/installer/steam.deb'

# User steamcmd games will run under.
node.default['valve_steam']['steamcmd_user'] = 'steam'

# Group steamcmd games will run under.
node.default['valve_steam']['steamcmd_group'] = 'steam'

# Set SteamCMD user's home dir.
node.default['valve_steam']['home_dir'] = '/home'

# Set SteamCMD user's default SHELL.
node.default['valve_steam']['steamcmd_user_shell'] = '/bin/bash'

# SteamCMD download URL.
node.default['valve_steam']['steamcmd_download_url'] = 'http://media.steampowered.com/installer/steamcmd_linux.tar.gz'


