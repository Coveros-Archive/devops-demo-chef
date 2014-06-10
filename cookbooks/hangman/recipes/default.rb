#
# Cookbook Name:: hangman
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

dbi = Chef::DataBagItem.load("chef_demo", "nexus")
my_user = dbi['user']
my_password = dbi['password']
base_url = 'https://#{my_user}:#{my_password}@jenkins.demo.secureci.com/nexus/content/repositories/snapshots'

yum_repository 'secureci-nexus' do
    description 'SecureCI Nexus Repo for the Demo'
    baseurl base_url
    gpgcheck false
    enabled true
    mirror_expire "30"
    sslverify false
    action :create
end

package 'hangman' do
    action :install
end
