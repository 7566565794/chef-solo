#
# Cookbook:: lab-windows
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

#Enable windows Telnet client Feature

windows_feature "Telnet-Client" do
    action :install
end