#
# Cookbook Name:: keyboard 
# Recipe:: default 
#
# Author:: Ryuzee <ryuzee@gmail.com>
#
# Copyright 2012, Ryutaro YOSHIBA 
#
# This software is released under the MIT License.
# http://opensource.org/licenses/mit-license.php

case node[:platform]
when "debian","ubuntu"
  template "/etc/default/console-setup" do
    source "console-setup/console-setup.erb"
    owner "root"
    group "root"
    mode "0644"
  end
  e = execute "loadkeys jp" do
    action :run
  end

when "centos"
  template "/etc/sysconfig/keyboard" do
    source "keyboard/keyboard.erb"
    owner "root"
    group "root"
    mode "0644"
  end
end

# vim: filetype=ruby.chef
