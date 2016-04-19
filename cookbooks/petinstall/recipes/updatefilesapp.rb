remote_file '/tmp/mysql-connector-java-5.1.26.tar.gz' do
  owner 'tomcat_petclinic'
  mode '0644'
  source 'https://dl.dropboxusercontent.com/u/957640/deploytest/mysql-connector-java-5.1.26.tar.gz'
  checksum 'fade4caa398c41f537d9b7bcaf83aabaa1eab1ef23c81de49979b5b04ba395bd'
end

 execute 'wait for webapp deploy (pom.xml)' do
    command 'while [ ! -f /opt/tomcat/webapps/petclinic/META-INF/maven/org.springframework.samples/spring-petclinic/pom.xml ]; do sleep 1s; done'
    action :run
 end


cookbook_file '/opt/tomcat/webapps/petclinic/META-INF/maven/org.springframework.samples/spring-petclinic/pom.xml' do
  source 'pom.xml'
  owner 'tomcat_petclinic'
  group 'tomcat_petclinic'
  mode '0644'
#  notifies :restart, 'tomcat_service[helloworld]'
end

 execute 'wait for webapp deploy (data-access.properties)' do
    command 'while [ ! -f /opt/tomcat/webapps/petclinic/WEB-INF/classes/spring/data-access.properties ]; do sleep 1s; done'
    action :run
 end

cookbook_file '/opt/tomcat/webapps/petclinic/WEB-INF/classes/spring/data-access.properties' do
  source 'data-access.properties'
  owner 'tomcat_petclinic'
  group 'tomcat_petclinic'
  mode '0644'
#  notifies :restart, 'tomcat_service[helloworld]'
end


 execute 'wait for webapp deploy (lib)' do
    command 'while [ ! -f /opt/tomcat/webapps/petclinic/WEB-INF/lib/validation-api-1.0.0.GA.jar ]; do sleep 1s; done'
    action :run
 end


 execute 'extract mysql connectors tarball' do
    command 'tar -xzf /tmp/mysql-connector-java-5.1.26.tar.gz -C /opt/tomcat/webapps/petclinic/WEB-INF/lib/ --strip-components=1'
    action :run
 end
