Vagrant.configure(2) do |config|
    config.vm.box = "centos_6_x64"
    config.vm.box_url = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130731.box"
    
    config.vm.network "forwarded_port", guest: 8080, host: 8080


    config.vm.host_name = "rud.chef.vm"

   #Update chef 
    config.vm.provision "shell" do |s|
       s.inline = "curl -L https://www.opscode.com/chef/install.sh | sudo bash"
    end


    VAGRANT_JSON = JSON.parse(Pathname(__FILE__).dirname.join('nodes', 'vagrant.json').read)

    config.vm.provision :chef_solo do |chef|
       chef.cookbooks_path = ["site-cookbooks", "cookbooks"]

       chef.json = VAGRANT_JSON
    end


end
