#
# Cookbook:: user
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
user "jyoti" do
    comment "this is a demo user created for checking databags"
    uid 2000 
    home '/home/jyoti'
    shell '/bin/bash'
    password 'abc123'
end