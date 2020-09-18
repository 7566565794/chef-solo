#installs Apache Web Server
execute "apt-get-update" do
    command "apt-get update"
end

package 'default-jdk' do
    action :install
end


file "/home/ubuntu/hello.java" do
    content 'class hello{
        public static void main(String args[])
        {
            System.out.println("hello World!!!");
        }
    }'
end

execute "hello_compile" do
    command "javac /home/ubuntu/hello.java"
end

execute "hello_run" do
    command "java /home/ubuntu/hello.java"
end

