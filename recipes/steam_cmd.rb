#
# Cookbook Name:: valve_steam
# Recipe:: steam_cmd
#
# Copyright 2014, Gerald L. Hevener Jr., M.S.
#

# Add steam user.
user node.default['valve_steam']['steamcmd_user'] do
  supports :manage_home => true
  comment 'Valve SteamCMD user'
  home node.default['valve_steam']['home_dir']
  shell node.default['valve_steam']['steamcmd_user_shell']
  username node.default['valve_steam']['steamcmd_user']
  gid node.default['valve_steam']['steamcmd_group']
end

# Create dir for steamcmd.
directory "#{node.default['valve_steam']['home_dir']}/#{node.default['valve_steam']['steamcmd_user']}/steamcmd" do
  owner node.default['valve_steam']['steamcmd_user']
  group node.default['valve_steam']['steamcmd_group']
  mode 00755
  recursive true
  action :create
end

# Download SteamCMD tar.gz.
remote_file "#{Chef::Config[:file_cache_path]}/steamcmd_linux.tar.gz" do
  source node.default['valve_steam']['steamcmd_download_url']
  action :create_if_missing
end

# Untar SteamCMD to home dir.
bash "Untar SteamCMD to home dir" do
  user "root"
  cwd "/tmp"
  code <<-EOH
  tar zxvhf #{Chef::Config[:file_cache_path]}/steamcmd_linux.tar.gz -C #{node.default['valve_steam']['home_dir']}/#{node.default['valve_steam']['steamcmd_user']}/steamcmd
  EOH
  not_if "test -d #{node.default['valve_steam']['home_dir']}/steamcmd  "
end
