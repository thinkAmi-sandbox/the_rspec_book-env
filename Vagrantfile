# -*- mode: ruby -*-
# vi: set ft=ruby :

# Uncomment these lines (and the ones in the generated Gemfile) if you want
# to live on the Edge:
#
Vagrant.require_plugin "vagrant-berkshelf"
Vagrant.require_plugin "vagrant-omnibus"

Vagrant.configure("2") do |config|
  config.vm.hostname = "the-rspec-book"

  config.omnibus.chef_version = :latest

  config.vm.box = "ubuntu120403"
  #config.vm.box_url = "https://opscode-vm-bento.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04_provisionerless.box"

  config.vm.network :private_network, ip: "33.33.33.10"

  config.vm.provider :virtualbox do |vb|
    vb.gui = true
  end

  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
    chef.json = {
      rbenv: {
        user_installs: [{
          user: "vagrant",
          rubies: ["1.8.7-p374"],
          global: "1.8.7-p374",
          gems: {
            "1.8.7-p374" => [
              { name: "bundler", 
                version: "1.0.22"
              },
              { name: "rspec",
                version: "2.0.0"
              },
              { name: "cucumber",
                version: "0.9.2"
              }
            ]
          }
        }]
      }
    }

    chef.run_list = [
      "apt",
      "git",
      "the_rspec_book-env",
      "ruby_build",
      "rbenv::user",
      "sublime-text"
    ]
  end

end