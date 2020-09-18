template '/tmp/somefile' do
    mode '0755'
    source 's.erb'
    not_if { File.exist?('/etc/passwd') }
end