#
# Cookbook:: cjdbc
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

execute "apt-get-update" do
    command "apt-get update"
end

packages = ["mysql-server" , "mysql-client"]
packages.each do |i|
    package i do
        action :install
    end
end

apt_update 'update' do
    action :update
end

package "libmysql-java" do 
    action :install 
end

file '/home/ubuntu/Jdbc.java' do
    content 'import java.sql.*;
    import java.net.*;
    import java.util.*;
    class Jdbc{
        public static void main(String a[]) throws Exception
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","jyoti" );
            Statement st=con.createStatement();
            ResultSet rs= st.executeQuery("select id,name from student");
            System.out.println("id are\n" + Integer.toString(rs.getInt("id")) + " "+ rs.getString("name"));

        }
    }'
end