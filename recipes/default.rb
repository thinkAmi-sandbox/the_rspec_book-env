#
# Cookbook Name:: the-rspec-book
# Recipe:: default
#
# author: thinkAmi

script "show_git_branch" do
  interpreter "bash"
  user        "root"
  code <<-'EOL'
    wget https://raw.github.com/git/git/master/contrib/completion/git-completion.bash -P /home/vagrant
    chmod -R 777 /home/vagrant/git-completion.bash
    echo source /home/vagrant/git-completion.bash >> /home/vagrant/.bashrc
    echo GIT_PS1_SHOWDIRTYSTATE=true >> /home/vagrant/.bashrc

    echo -n export PS1=\' >> /home/vagrant/.bashrc
    echo -n '\[\033[01;32m\]\u@\[\033[01;33m\] \w$(__git_ps1) \[\033[01;34m\]\$\[\033[00m\] ' >> /home/vagrant/.bashrc
    echo \' >> /home/vagrant/.bashrc

    source /home/vagrant/.bashrc
  EOL
end


# enable gem install cucumber --version 0.9.2
package "gcc-4.5" do
  action :install
end

script "change_gcc45" do
  interpreter "bash"
  user        "root"
  code <<-'EOL'
    rm /usr/bin/gcc
    ln -s /usr/bin/gcc-4.5 /usr/bin/gcc
  EOL
end