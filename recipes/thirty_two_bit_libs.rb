#
# Cookbook Name:: valve_steam
# Recipe:: thirty_two_bit_libs
#
# Copyright 2014, Gerald L. Hevener Jr., M.S.
#

case node['platform_family']

  when "debian"

    # Install thirty two bit libraries.
    package "ia32-libs-multiarch" do
      only_if 'apt-cache search ia32-libs-multiarch |grep ia32-libs-multiarch'
    end

    # ia32-libs* pkgs are deprecated on ubuntu 14.04.
    %w{ lib32z1 lib32z1-dev lib32ncurses5 lib32ncurses5-dev lib32bz2-1.0 }.each do |pkg|
      package pkg
    end

end
