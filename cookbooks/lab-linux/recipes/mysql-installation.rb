#
# Cookbook:: cjdbc
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

execute "apt-get-update" do
    command "apt-get update"
end

packages = ["mysql-server" , "mysql-client"]
packages.each do |i|
    package i do
        action :install
    end
end

apt_update 'update' do
    action :update
end

package "libmysql-java_5.1.45-1_all" do 
    action :install 
end