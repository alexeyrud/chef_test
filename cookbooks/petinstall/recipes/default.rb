include_recipe 'petinstall::tomcatinstall'
include_recipe 'petinstall::updatefilesapp'
include_recipe 'petinstall::petclinicstop'
include_recipe 'petinstall::addruleiptables'
include_recipe 'petinstall::mysqlinstall'
include_recipe 'petinstall::mysqlcreatedb'
include_recipe 'petinstall::petclinicstart'
