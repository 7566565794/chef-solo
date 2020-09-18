template "/etc/sysctl.d/99-chef-net.ipv4.ip_local_port_range.conf" do
    source "kernel_parameter_val.erb"
    action:create
    mode "644"
    only_if do
        File.exist?('/etc/sysctl.d/99-chef-net.ipv4.ip_local_port_range.conf')
      end
  end
=begin
sysctl 'fs.aio-max-nr' do
    value '1048576'
end
  
sysctl 'net.ipv4.ip_local_port_range' do
    value '9000 65500'
end
  
sysctl 'kernel.sem' do
    value '250 32000 100 128'
end
=end