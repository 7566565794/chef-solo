#installs Apache Web Server
package "apache2" do
    action :install
end

service "apache2" do
    action [:enable, :start]
end
=begin
template "/etc/apache2/" do
    source "apache.conf.erb"
    owner : "root"
    group : "root"
    mode : "0644"
    notifies : restart, "service[apache2]"
end
=end
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

  