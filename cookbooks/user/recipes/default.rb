#
# Cookbook:: user
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
jyoti_password=data_bag_item('user_password','jyoti')
puts(jyoti_password)
user "jyoti" do
    comment "this is a demo user created for checking databags"
    uid 2000 
    home '/home/jyoti'
    shell '/bin/bash'
    password jyoti_password['password']
end