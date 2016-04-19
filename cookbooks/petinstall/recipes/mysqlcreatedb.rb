  execute 'Create database Petclinic' do
    command 'mysql -h127.0.0.1 -uroot -proot -e "create database petclinic;"'
    action :run
 end
