# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  config.vm.box = "fedora/25-cloud-base"
  config.vm.synced_folder "./", "/vagrant", type: "nfs", fsnotify: true

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  config.vm.provider :libvirt do |libvirt|
    libvirt.cpus = 8
    libvirt.memory = 4096
  end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    ELIXIR_VERSION=1.3.1

    sudo dnf update -y
    sudo dnf install -y vim git wget tree make erlang inotify-tools

    if [ ! -d ~/.exenv ]; then
      git clone git://github.com/mururu/exenv.git ~/.exenv
      echo 'export PATH="$HOME/.exenv/bin:$PATH"' >> ~/.bash_profile
      echo 'eval "$(exenv init -)"' >> ~/.bash_profile
      source ~/.bash_profile
    else
      cd ~/.exenv
      git pull
      cd ~
    fi

    if [ ! -d ~/.exenv/plugins/elixir-build ]; then
      git clone git://github.com/mururu/elixir-build.git ~/.exenv/plugins/elixir-build
    fi

    exenv versions | grep $ELIXIR_VERSION
    if [ $? -eq 1 ]; then
      exenv install $ELIXIR_VERSION
    fi

    exenv global $ELIXIR_VERSION
  SHELL
end
