 execute 'start petclinic app' do
    command 'curl --user tomcat:s3cret http://localhost:8080/manager/text/start?path=/petclinic'
    action :run
 end
