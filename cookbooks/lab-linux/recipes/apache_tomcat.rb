=begin
#step 1: is to install java
execute "apt-get-update" do
    command "apt-get update"
end

package 'default-jdk' do
    action :install
end

#step 2: Create Tomcat User
group 'tomcat' do
    action :create
    append true
end

user 'tomcat' do
    action:create
    comment 'A random user'
    uid 1234
    gid 'tomcat'
    home '/opt/tomcat'
    shell '/bin/false'
    password 'abc123'
  end

#if folder doesnt exist then creating the folder in the location
# execute "folder create" do
#     folder_path='/opt/tomcat'
#     command "sudo mkdir folder_path"
#     not_if { ::Dir.exist?(folder_path) 
# end

directory "/opt/tomcat" do
  action :create
  not_if { ::Dir.exist?("/opt/tomcat") }
end

#step3 Install Tomcat
bash 'install_something' do
    user 'tomcat'
    cwd '/tmp'
    code <<-EOH
    not_if do
        wget http://apache.mirrors.ionfish.org/tomcat/tomcat-10/v10.0.0-M8/bin/apache-tomcat-10.0.0-M8.tar.gz
        File.exist?('/tmp/apache-tomcat-10.0.0-M8.tar.gz')
      end
    sudo tar -zxf apache-tomcat-10.0.0-M8.tar.gz 
    cp -r /tmp/apache-tomcat-10.0.0-M8 /opt/tomcat/apache-tomcat-10.0.0-M8
    EOH
end


#Step 4: Update Permissions
=end
#
# Cookbook:: tomcat
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
=begin
execute 'group-add' do
 command "sudo groupadd tomcat"
 command "sudo useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat"
end
=end
 
apt_package 'tomcat9' do
  action :install
end

service 'tomcat9' do
action [:enable, :start]
end

cookbook_file '/etc/tomcat9/tomcat-users.xml' do
source 'tomusers.xml'
notifies :restart , 'service[tomcat9]'# resource['package name']
end

cookbook_file '/lib/systemd/system/tomcat9.service' do
source 'config1.service'
notifies :restart , 'service[tomcat9]'
end

file '/var/lib/tomcat9/webapps/ROOT/hi.html' do
content '<h1>Hello-world from jyoti  ghanghoriya!!</h1>'
notifies :restart ,'service[tomcat9]'
end

=begin
template '/etc/default/tomcat9' do
source 'tomtemplate.erb'
action :create
notifies :restart,'service[tomcat9]'
end
# Install Jenkins/other package frome remote repository
remote_file '/var/lib/tomcat9/webapps/jenkins.war' do
source 'https://mirrors.tuna.tsinghua.edu.cn/jenkins/war-stable/2.249.1/jenkins.war'#specify download path of jenkins.war in official website
action :create
notifies :restart , 'service[tomcat9]'
end

=end




