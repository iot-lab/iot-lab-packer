Vagrant.configure("2") do |config|
  config.vm.box = "iotlab/iotlab-vm"
  config.ssh.username = "user"
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.provider "virtualbox" do |v|
    v.name = "iotlab-vm"
  end
end
