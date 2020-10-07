#
# Cookbook:: rsyslog
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
apt_package 'rsyslog' do
    action :install
end
  
# service 'tomcat9' do
#   action [:enable, :start]
# end
  
# cookbook_file '/etc/tomcat9/tomcat-users.xml' do
#   source 'tomusers.xml'
#   notifies :restart , 'service[tomcat9]'# resource['package name']
# end
  
# cookbook_file '/lib/systemd/system/tomcat9.service' do
#   source 'config1.service'
#   notifies :restart , 'service[tomcat9]'
# end
  
# file '/var/lib/tomcat9/webapps/ROOT/hi.html' do
#   content '<h1>Hello-world from jyoti  ghanghoriya!!</h1>'
#   notifies :restart ,'service[tomcat9]'
#   end
  