#
# Cookbook Name:: hangman
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apache2::mod_proxy'
include_recipe 'apache2::mod_proxy_ajp'

dbi = Chef::DataBagItem.load("chef_demo", "nexus")

yum_repository 'secureci-nexus' do
    description 'SecureCI Nexus Repo for the Demo'
    baseurl "https://#{dbi['user']}:#{dbi['password']}@jenkins.demo.secureci.com/nexus/content/repositories/snapshots"
    gpgcheck false
    enabled true
    mirror_expire "30"
    sslverify false
    action :create
end

package 'hangman' do
    action :install
end

template "/etc/httpd/conf.d/proxy_ajp.conf" do
    source "proxy_ajp.conf.erb"
end

template "/usr/share/tomcat6/conf/server.xml" do
    source "server.xml.erb"
end

service 'httpd' do
    action :restart
end
