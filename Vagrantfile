# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'json'

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

vagrantConfigFile = "vagrantConfig.json"

if File.exists?(vagrantConfigFile)
  userConfig = JSON.parse(File.read(vagrantConfigFile))
else
  userConfig = {}
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box     = "ubuntu/trusty64"
  config.vm.provider :virtualbox do |vb|
    vb.name = "squeel.inventid.net"
  end

  memory = userConfig["memory"] || 2048
  cpus = userConfig["cpus"] || 2
  config.vm.synced_folder "../squeel/", "/opt/squeel"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", memory, "--cpus", cpus]
  end


  config.vm.hostname = "squeel.inventid.net"
  config.vm.provision :shell, :path => "puppet/provision.sh"

end
