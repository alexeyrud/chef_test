 execute 'stop petclinic app' do
    command 'curl --user tomcat:s3cret http://localhost:8080/manager/text/stop?path=/petclinic'
    action :run
 end
