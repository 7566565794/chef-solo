#
# Cookbook:: lab-linux
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
template "/etc/apache2/apache2.conf" do
    source "sample.erb"
    owner "root"
    group "root"
    mode "644"
    variables :hostname => node["fqdn"]
  end