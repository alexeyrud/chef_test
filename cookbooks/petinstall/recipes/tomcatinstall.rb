# make sure we have java installed
include_recipe 'java'

# Install Tomcat 7.0.44 to a custom path and install the example content / docs
tomcat_install 'petclinic' do
  version '7.0.69'
  exclude_examples false
  exclude_docs false
  install_path '/opt/tomcat/'
end


cookbook_file '/opt/tomcat_petclinic/conf/tomcat-users.xml' do
  source 'tomcat-users.xml'
  owner 'root'
  group 'root'
  mode '0644'
#  notifies :restart, 'tomcat_service[helloworld]'
end

remote_file '/opt/tomcat/webapps/petclinic.war' do
  owner 'tomcat_petclinic'
  mode '0644'
  source 'https://dl.dropboxusercontent.com/u/957640/deploytest/petclinic.war'
  checksum 'b1d6bc8d927d2ce63461a930f1d8cc9c3d003ba5d7471eb7dc90330300e2f5e4'
end

# start the tomcat docs install
tomcat_service 'petclinic' do
  action [:start, :enable]
  install_path '/opt/tomcat/'
end

