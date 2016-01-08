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
include_recipe 'apache2::mod_proxy_http'

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

template '/etc/httpd/conf.d/proxy_ajb.conf' do
    source 'proxy_ajp.conf.erb'
end

#This is a horrible hack fix the rpm when we can
execute  'move war' do
    command 'cp /var/lib/tomcat6/webapps/hangman.war /var/lib/tomcat7/webapps/'
end
execute  'change war ownership' do
    command 'chown tomcat /var/lib/tomcat7/webapps/*.war'
end

#This needs to use a chef service
execute  'restart tomcat' do
    command '/etc/init.d/tomcat7 restart'
end
