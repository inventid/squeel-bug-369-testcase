[![Build Status](https://travis-ci.org/inventid/squeel-bug-369-testcase.svg?branch=master)](https://travis-ci.org/inventid/squeel-bug-369-testcase)

We love Squeel.
It makes SQL syntax simply so much better.

However sometimes a bug may incidentally enter such a project.
This repo serves as the test case of a [bug](https://github.com/activerecord-hackery/squeel/issues/369).

The failing statements are marked in `rspec` with `failure: true`.

To test, simply clone the repo.
Then start the Vagrant machine, using `vagrant up`.
Once provisioning finishes, follow the last commands in the output:

- First install the gems: `source $HOME/.rvm/scripts/rvm`
- Then install Bundler: `cd /vagrant && gem install bundler`
- Finally, run the tests: `export RAILS_VERSION=4.2.1; rm Gemfile.lock; bundle install; bundle exec rspec`.
- Replace the rails version in the command with the one you want to test with.

