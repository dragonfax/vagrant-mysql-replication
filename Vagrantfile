
=begin
creates 2 vms.
each with its own mysql database.
then connects them as master and slave.
=end

Vagrant::Config.run do |config|

  config.vm.box = 'lucid32'
  config.vm.box_url = 'http://files.vagrantup.com/lucid32.box'

  [1,2].each do |node_num|
    node = "db#{node_num}".to_sym
    config.vm.define node do |node_config|
      node_config.vm.host_name = node.to_s
      node_config.vm.network :hostonly, "192.168.2.#{10 + node_num}"
      node_config.vm.provision :chef_solo do |chef|
        chef.cookbooks_path = "cookbooks"
        chef.roles_path = "roles"
        chef.add_role(node_num == 1 ? 'master' : 'slave')
        chef.json = {
          :mysql => {
            :tunable => {
              :server_id => node_num,
             },
            :server_root_password => "",
            :server_repl_password => "repl_pw",
            :server_debian_password => "",
            :master_bind_address => "192.168.2.#{10 + 1}"
          }
        }
      end
    end
  end

end
