 execute 'Add iptables rule for tomcat' do
    command 'iptables -I INPUT 4 -p tcp -m tcp --dport 8080 -j ACCEPT'
    action :run
 end
