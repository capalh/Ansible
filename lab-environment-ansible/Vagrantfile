## Prepare ansible test environment, three Linux host running CentOSv7

host_list = [

    {
        :name => "master",
        :eth1 => "192.168.200.11",
        :mem => "2048",
        :cpu => "2"
    },
    {
        :name => "host-2",
        :eth1 => "192.168.200.12",
        :mem => "2048",
        :cpu => "1"
    },
    {
        :name => "host-3",
        :eth1 => "192.168.200.13",
        :mem => "2048",
        :cpu => "1"
    },

]

Vagrant.configure("2") do |config|  
    config.vm.box = "centos/7"                         
    host_list.each do |item|                                       
        config.vm.define item[:name] do |host|                      
            host.vm.hostname = item[:name]
            host.vm.provider "virtualbox" do |v|
              v.customize ["modifyvm", :id, "--memory", item[:mem]]
              v.customize ["modifyvm", :id, "--cpus", item[:cpu]]
            end                  
            host.vm.network "private_network", ip: item[:eth1]      
        end
    end
    config.vm.provision "shell", path:"./setup.sh"    
end