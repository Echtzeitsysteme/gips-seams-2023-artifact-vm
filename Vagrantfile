Vagrant.configure("2") do |config|
    config.vm.box = "gips"
    config.vm.define 'ubuntu'
    config.vm.provider :virtualbox do |vb|
        vb.name = "gips-seams"
        vb.memory = 8192
        vb.cpus = 2
    end
    config.vm.provision "shell", path: "prov.sh", privileged: false

    # Prevent SharedFoldersEnableSymlinksCreate errors
    config.vm.synced_folder ".", "/vagrant", disabled: true

    config.ssh.username = 'vagrant'
    config.ssh.password = 'vagrant'
    config.ssh.insert_key = false
end
