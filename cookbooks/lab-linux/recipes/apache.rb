#installs Apache Web Server
package "apache2" do
    action :install
end

service "apache2" do
    action [:enable, :start]
end

cookbook_file '/etc/apache2/ports.conf' do
    source 'port.conf'
    notifies :restart , 'service[apache2]'
end

cookbook_file '/etc/apache2/sites-available/000-default.conf' do
    source '000-default.conf'
    notifies :restart , 'service[apache2]'
end

cookbook_file '/etc/apache2/sites-available/default-ssl.conf' do
    source 'default-ssl.conf'
    notifies :restart , 'service[apache2]'
end

cookbook_file '/var/www/html/welcome.html' do
    source 'welcome.html'
    notifies :restart , 'service[apache2]'
end

file "var/www/html/hello.html" do
    content "<html>
                <head></head>
                <body>
                <h1>Hello </h1>
                </body>
            </html>"
end

# template "/etc/apache2/apache2.conf" do
#     action :create_if_missing
#     source "sample.erb"
#     owner "root"
#     group "root"
#     mode "644"
#     variables :hostname => node["fqdn"]
#   end

  