#!/bin/bash

echo "Ignore the red scary message above if it says 'stdin: is not a tty', it is not actually an error but cannot be fixed by us"

# Create swapfile of 1GB with block size 1MB
/bin/dd if=/dev/zero of=/swapfile bs=1024 count=1048576 > /dev/null 2>&1

# Set up the swap file
/sbin/mkswap /swapfile > /dev/null 2>&1

# Enable swap file immediately
/sbin/swapon /swapfile > /dev/null 2>&1

# Enable swap file on every boot
/bin/echo '/swapfile          swap            swap    defaults        0 0' >> /etc/fstab

echo "Updating stuff"
apt-get update > /dev/null 2>&1

echo "Installing stuff"
sudo apt-get remove ruby -y && sudo apt-get upgrade -y
sudo apt-get install curl libmysqlclient-dev -y
export HOME=/home/vagrant
sudo -u vagrant gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | sudo -u vagrant bash -s stable --ruby

echo "Finished installing"
echo "Enter the box with 'vagrant ssh', then go to the correct dir (/vagrant)"
echo "Now run rmv etc 'source $HOME/.rvm/scripts/rvm'"
echo "And install the gems 'cd /vagrant && gem install bundler && bundle install --system', and run the tests 'bundle exec rspec'"
