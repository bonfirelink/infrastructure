Vagrant.configure("2") do |config|
  config.vm.box = "debian/buster64"

  # Disable the default shared folder
  config.vm.synced_folder ".", "/vagrant", disabled: true

  # Provider-specific configuration
  config.vm.provider "virtualbox" do |vb|
    vb.name = "bonfire.link"
  end
end
