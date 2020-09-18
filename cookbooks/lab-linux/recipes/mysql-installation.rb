#
# Cookbook:: cjdbc
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
packages = ["mysql-server" , "mysql-client" , "libmysql-java"]
packages.each do |i|
    package i do
        action :install
    end
end