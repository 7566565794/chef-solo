template "/home/ubuntu/test.txt" do
    source "sample.erb"
    owner "root"
    group "root"
    mode "644"
    not_if do
        File.exist?('/etc/apache2/random.conf')
      end
    variables :hostname => node["fqdn"]
  end