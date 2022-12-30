Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.hostname = "moodle.test"
  config.vm.network :private_network, ip: "192.168.0.10"
  config.vm.synced_folder ".", "/vagrant", type: "rsync",
      rsync__exclude: ".git/",
      rsync__auto: true
  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.cpus = 3
  end
  config.vm.provision "shell", path: "script.sh"
end
