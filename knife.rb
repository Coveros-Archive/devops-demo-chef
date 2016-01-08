log_level                :info
log_location             STDOUT
node_name                'jenkins'
client_key               '/home/ubuntu/.chef/jenkins.pem'
validation_client_name   'chef-validator'
validation_key           '/home/ubuntu/.chef/chef-validator.pem'
chef_server_url          'https://chef-server.demo.secureci.com'
syntax_check_cache_path  '/home/ubuntu/.chef/syntax_check_cache'
knife[:aws_access_key_id] = "AKIAI7FSE4ZGQFGR5JKQ"
knife[:aws_secret_access_key] = "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"
cookbook_path [
  '/usr/share/tomcat7/tmp',
]
